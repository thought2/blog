---
layout: post
title:  "It's all about Translation"
date:   2019-09-16 13:51:22 +0200
categories: 
---

Maybe you're starting to learn coding but you are confused how many programming languages are out there. Which one to pick? What are the differences? Everyone is recommending enthusiastically a different one. And then you hear that all of those languages can even be translated into each other. And that confuses even more. Aren't they then all the same in the end? This post tries to give an overview of how programming languages may differ. Especially of how they relate to the actual hardware they're running on.


# Hardware vs. Software

When writing or running a computer program there are always those two parts involved: the hardware and the software. And there is a very interesting interface that translates what is described in software into it's execution on the actual hardware.

Hardware is usually some memory (RAM and hard drive) and some CPU that can manipulate this memory based on instructions. Even though nowadays the concrete hardware implementations are based on electronics, the mechanism can also be described as a theoretical model: The [Turing machine](https://en.wikipedia.org/wiki/Turing_machine). It's an <cite>".. abstract machine, which manipulates symbols on a strip of tape according to a table of rules"</cite> (Wikipedia). It turned out that every computer program (software)  can be described as a Turing machine regardless of it's concrete implementation. A Turing machine can be built from silicon, wood or: Fun meta fact: There's even a complete [Turing machine implementation in mine craft](https://www.youtube.com/watch?v=1X21HQphy6I).
It also turned out that this separation between memory (tape in the Turing model) on the one hand and the instruction set (table) on the other hand can be dissolved. The actual instructions can be encoded on the memory, too. This is then called an universal Turing machine. <cite>"This principle is considered to be the origin of the idea of a stored-program computer used by John von Neumann in 1946 [..] that now bears von Neumann's name: the von Neumann architecture."</cite> And mostly all of today's computer's happen to be designed by this principle.

Of course it's interesting to look into the electronics, the bare metal side of computing. But on the other hand it's also a reasonable place to make a cut. Reasoning about software can be completely independent from the hardware.


# Low Level Languages

On the software side technologies are stacked on top of each other. That means that there is a very low level part that communicates directly with the hardware and there are a number of abstractions on top of that. The lowest level is the actual machine code and it's different for every CPU. <cite>"Every processor or processor family has its own instruction set."</cite> (Wikipedia). <cite>"..Machine code is a strictly numerical language [...], and may be regarded as the lowest-level representation of a [...] computer program."</cite> (Wikipedia)
An example for machine code would be `00000101`, theoretically any program can be written in that form but practically no human can reason about this numbers. That's why the assembly languages where invented to give a thin and more human readable layer on top. They are also CPU independent. Assembly language <cite>"..is any low-level programming language in which there is a very strong correspondence between the instructions in the language and the architecture's machine code instructions. Assembly language may also be called symbolic machine code."</cite> (Wikipedia)

Example in assembly:
```
MOV AL, 1h
MOV CL, 2h
MOV DL, 3h
```

Again, any program can be written in assembly language but it's still extremely unpractical for complex applications. Maybe a hardware driver is still written in assembly nowadays, but any more complex application would be written in a language that adds another layer on top to make it more suitable for humans to write and read.

C for example is prominent as it's still very close to the imperative machine instructions it translates to. <cite>"By design, C provides constructs that map efficiently to typical machine instructions and has found lasting use in applications previously coded in assembly language."</cite> (Wikipedia)

# High level languages: The imperative way

And there are a myriad of different languages that add more helpful constructs and abstractions, all of them finally being translated to one of those low level forms, sometimes directly and sometimes with many in between steps. The features on top are: Functions, Objects, Classes and much more. This new layers where labeled first structured programming, later object oriented programming. It's about using more graspable and nested structures to model more real world entities within the language.  

  Coming back to the question: Which language should I learn as a beginner. In a way it's reasonable to go for a very low level language, as this is something the more high level languages translate to anyways.

# High level languages: The declarative way

Another way of looking at the problem is to start thinking about the problem from the other end of the chain. One could ask: Which notation or rule set can we use to describe a computer program. And even more: How can we maximize our confidence that programs written in this way behave correctly. The more low level your language is the more likely it is that you make and oversee mistakes. Computers are good at repetitive tasks, humans not so much. Languages like C, C++, C#, Java, Python can be regarded as powerful and convenient abstractions on top of a Turing machine but they still stick to the underlying paradigm: imperative instructions.

There is another computational model which does not have that immediate 1:1 correlation to the actual hardware internals. It's the lambda calculus. From Wikipedia: Lambda calculus <cite>"is a formal system [...] for expressing computation based on function abstraction and application using variable binding and substitution."</cite>. Like Turing machines the lambda calculus can be used to describe every possible program.
Lambda calculus is a very simple set of rules, the advantage over a Turing machine is that more composable and predictable. It does not focus much on how and when things are done but more on what should be done. It's more declarative than imperative. Purely functional languages like `Haskell`, `Elm` or `PureScript` are implementations of the lambda calculus. A lambda (a function) that is fed with the same arguments is guaranteed to always return the same result. No matter when or even if the actual function was 'executed'. Based on this simple guarantee more complex ones can be derived. Having this key concept as the very basis of the language gives you a very powerful way to tell if your program behaves correctly or not.

However, this way of thinking about computation is admittedly quite far away from the way today's computers work. And that's why you need a quite complex layer that tries to translate something lambda calculus based into real machine instructions. Functional programming is researched on since more than 50 years. And for a long time it was said to be very powerful but not really practical because the gained safety came with the cost of less performance. During the last decades this changed a lot. More and more efficient ways where discovered to implement functional languages efficiently. And because of their guarantees they can be analyzed quite well. This even leads to implementations that outperform the imperative ones. E.g. the functional ClojureScript wrapper around React turned out to be faster than React itself.

Since those problems get better and better solutions, functional programming is entering more and more into mainstream programming languages. In reality most languages nowadays don't follow one paradigm (like imperative, object oriented, functional) but provide some mix of them. Languages that where originally intended to be e.g. object oriented, like Java, are getting more functional constructs in their more recent versions. JavaScript is a bit of an exception. As it already has quite some functional and also object oriented properties baked in its implementation. But the emphasis on the functional ones is increasing: Famous libraries like Redux, React, Lodash are good examples for this.

So the other way of looking at the problem is: Ask first: How can I best model programs. And second: How can that be fed into a real computer. Maybe the fact that the underlying machines follow the "Von Neumann" architecture is not set in stone. See this canonical article by John Backus on this topic: ["Can Programming Be Liberated from the von Neumann Style? A Functional Style and Its Algebra of Programs"](http://www.thocp.net/biographies/papers/backus_turingaward_lecture.pdf)
Maybe the necessary translation is more arbitrary than we need to assume.

# So what should I learn?

However, all those aspects and also different layers will play a role in modern real world software development. And I think it makes sense to learn some bits of each. It's not bad to know about some language that's close to the machine. Also it's quite helpful to look at a language that does not care about this too much. Looking at the "Turing machine" and "lambda calculus" will help to increase the understanding in a language independent way. And there are also some interesting meta/cross exercises: Like implement an Universal Turing Machine in a high level functional language. Or: Implement a LISP (that's based on the lambda calculus) [in an imperative language like python or C](http://buildyourownlisp.com/) .
But why those exercises for things that have been already done. Fair point, never reinvent the wheel. But in the end, translating something lower level to something higher level (or vice versa) is what you will encounter when writing every non trivial piece of software. Usually the lowest level of your project is the language you use. Then you will use some libraries that provide you an easy interface for things you don't want or cannot implement yourself. And even inside your code base, you may design some parts as if they where libraries for your very specific problem domain. Ideally you'd do so in a very composable and reusable way. This is like inventing a higher language inside the language you are using. And maybe this even happens in separated steps which build on top of each other. This is also sometimes referred to as the "onion model". The core of your program can then be just the an composition and application of those building blocks. So maybe it's less the question of "Which language should I use" and more: Which strategies and practices do I use to achieve conversions between the different levels of abstraction.