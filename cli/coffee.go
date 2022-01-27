package main

import (
	"bytes"
	"flag"
    "path/filepath"
	"fmt"
	"io/ioutil"
	"os"

	"bitbucket.org/ale-cci/elk/pkg/compiler"
	"os/exec"
)

type Args struct {
	files []string
	outfile string
}

func ParseArgs() *Args {
	a := Args{
		files: []string{},
	}

	flag.Func("in", "File to compile", func(s string) error {
		_, err := os.Stat(s)
		a.files = append(a.files, s)
		return err
	})
	flag.StringVar(&a.outfile, "out", "a.out", "Executable name")

	flag.Parse()
	if len(a.files) == 0 {
		flag.Usage()
		os.Exit(1)
	}

	return &a
}

func abspath(relpath string) (string) {
	path, err := os.Getwd()
	if err != nil {
		panic(err)
	}

    abspath := filepath.Join(path, relpath)
	return abspath
}

func main() {
	args := ParseArgs()
	abspath := args.files[0]
	content, err := ioutil.ReadFile(abspath)

	tokens, err := compiler.Tokenize(bytes.NewReader(content))
	if err != nil {
		panic(fmt.Sprintf("Error on tokenize: %v", err))
	}

	ast, err := compiler.Parse(tokens)
	if err != nil {
		panic(fmt.Sprintf("Error on ast parsing: %v", err))
	}

	scopes := compiler.BuildScopes(abspath)

	code, err := compiler.ToLLVM(scopes, ast)
	if err != nil {
		panic(fmt.Sprintf("Error on llvm conversion: %v", err))
	}

	// if err := os.Chdir("build"); err != nil {
	// 	panic(fmt.Sprintf("Unable to write build/test.ll: %v", err))
	// }

	llfile := args.outfile + ".ll"
	asmfile := args.outfile + ".s"

	if err := ioutil.WriteFile(llfile, []byte(code), 0644); err != nil {
		panic(fmt.Sprintf("Unable to write %s: %v", llfile, err))
	}

	if _, err := exec.Command("llc", "--relocation-model", "pic", llfile).Output(); err != nil {
		panic(fmt.Sprintf("llc error on %s %v", llfile, err))
	}

	if out, err := exec.Command("gcc", asmfile, "-o", args.outfile).Output(); err != nil {
		fmt.Printf("Gcc output: %s\n", out)
		panic(fmt.Sprintf("gcc error on %s: %v", asmfile, err))
	}
	fmt.Printf("File %s compiled successfully!\n", args.outfile)
}
