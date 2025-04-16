@def title = "Alec Hoyland's Website"
@def tags = ["syntax", "code"]
@def maxtoclevel=2

# Alec Hoyland, Journeyman Neuromancer

I'm a machine learning engineer and computational scientist
with a background in computational neuroscience.
I've worked on diverse projects such as fine-tuning and quantization of LLMs,
parameter optimization of biophysically-realistic neuronal networks,
ML-optimization of audio signal reconstruction,
and object detection from satellite imagery.

### Table of Contents
\toc


## Contact Me

[alec.hoyland@posteo.net](mailto:alec.hoyland@posteo.net) | [GitHub](https://github.com/alec-hoyland) | [LinkedIn](https://www.linkedin.com/in/alec-hoyland-a00a4b90/) | [CV](/assets/CV.pdf)

## Code & Projects

Unfortunately, a lot of the work I've done
is classified or proprietary, but here are some snapshots
of open-source projects I've worked on.

### [TinnitusReconstructor.jl](https://github.com/The-Lammert-Lab/TinnitusReconstructor.jl)

Most people think of tinnitus as "ringing in the ears,"
but the space of tinnitus percepts is much more diverse than that.
About 20-50% of tinnitus percepts are non-tonal sounds.
There's strong evidence that knowing a patient's tinnitus percept
can help treat the condition via sound therapy.

We devised a reverse correlation experiment
where subjects listen to randomized noise
to see if they recognize their tinnitus sound within it.
We can use compressed sensing and regression algorithms
to reconstruct detailed spectral representations of what their tinnitus percept sounds like.

> See also: [tinnitus-reconstruction](https://github.com/The-Lammert-Lab/tinnitus-reconstruction).

### [xolotl](https://xolotl.readthedocs.io/en/master/)

Xolotl is a fast single- and multi-compartment neuronal network simulator
written in C++ with a MATLAB interface you'll actually like.
We built it after being disappointed by the neuronal network simulation software
already out there.

Since we were simulating thousands of models with hundreds of stiff equations,
we needed something fast, and we wanted it to be usable too.
As far as I am aware, xolotl is still the fastest simulator out there,
though [`Conductor.jl`](https://wsphillips.github.io/Conductor.jl/stable/basics/) is only a bit slower.
if you take the guardrails off.

Xolotl has built in parallelization and parameter optimization,
as well as interactivity for hand-tuning parameters live.

\figalt{Hand-tuning parameters using sliders}{/assets/xolotl.gif}


### [ReducedOrderModelsProject.jl](https://alec-hoyland.github.io/ReducedOrderModelsProject.jl/)

In this project, I derive a formulation for a reduced order model that exploits the structure of a partial differential equation to solve it at high accuracy at arbitrary parameter values, using far fewer FLOPs to do so than with traditional linear system solvers, numerical simulation, or approximation by neural networks (surrogates).

A reduced order model (ROM) is a smaller model that mimics the results of a larger model. Often in mathematical modeling and numerical simulation, you run into issues with increasing computational complexity where the state spaces gets too large, or numerical simulations become infeasible. ROMs alleviate this problem by providing a smaller model that can be used in simulations or numerical computations instead. A good ROM has a small approximation error compared to the full order model and conserves the properties of the larger model.

I construct a rational Krylov subspace, where the vectors in the subspace
are solutions to the partial differential equation I'm simplifying
at different parameter values.
A solution for an arbitrary parameter value is a linear combination
of the solutions from the subspace.
Thus, the Krylov subspace forms a basis for the solutions of the PDE system.

It turns out that we don’t need to know all the vectors in the subspace; we only need about 10. The ROM is constructed by looking at the differences between solutions and accurately captures the dynamics with only a few examples. This method has far better performance than a neural network function approximator because vanilla neural networks don’t exploit the known dynamics for the system. Here, we can write the equation of state, so we can take advantage of them directly.

### [Audio-ML](https://github.com/alec-hoyland/audio-ml)

I developed some demos of supervised and unsupervised machine learning for audio using PyTorch.

In one notebook, I developed an unsupervised ML model for speech detection
using open-unmix for denoising, Mel-frequency cepstral coefficients for features,
dimensionality reduction using UMAP, and clustering using k-means.

I also use `whispercpp` to transcribe speech.

In a [literate programming](https://en.wikipedia.org/wiki/Literate_programming) script,
I build a convolutional autoencoder that uses 2-D convol ution and max pooling
to reduce the dimensionality of an audio signal (represented as a Mel-frequency spectrogram)
in the latent space.

### [MLP-Demo](https://github.com/alec-hoyland/mlp-demo)

I wrote this demo for middle school after-school program students
who were interested in robotics and machine learning.
We got to play around with it interactively as they tried to figure
out how it worked and how to break it.


<!-- TODO: embed this video -->

### [BandwidthEstimator](https://github.com/hasselmonians/BandwidthEstimator)

This package implements a maximum-likelihood leave-one-out cross-validated
bandwidth parameter estimation for smoothing a neural spike train.
The bandwidth parameter tells you what intrinsic time-scale 
the spike train encodes.

This package works with [RatCatcher](https://github.com/hasselmonians/RatCatcher),
which is a MATLAB utility for parsing data and passing analysis scripts
from a local machine to a high-performance computing cluster
to run in parallel, before re-stitching the analyses together afterwards.

## Writings

### [Chat Metrics for Enterprise-Scale Retrieval-Augmented Generation](https://www.yurts.ai/blog/chat-metrics-for-enterprise-scale-rag)

I designed a suite of "chat metrics" -- unsupervised ML-based metrics for quantifying the performance
of both the retrieval and generation steps of retrieval-augmented generation with LLMs.
Here's a blog post discussing some of them.

### [Differential Responses to Neuromodulation in Model Neurons of the Crustacean Stomatogastric Ganglion](https://github.com/alec-hoyland/master-thesis)

*Master of Neuroscience thesis at Brandeis University*

Neuronal networks must produce stable circuit output for sustained
periods of time despite environmental perturbation. In addition, they
must be sensitive to key endogenous signaling to produce differing
output. The STG manages these competing objectives while remaining
degenerate to ion channel density. Neuromodulators can produce a
diverse set of network states using the same cellular and synaptic
morphology. In particular to the STG, the dense, tangled neuropil and
gradations in reversal potential render neurons isopotential with respect to the somata. Neuromodulators, then, play the role of maintaining and switching network activity.
For stable and responsive biological activity, degenerate networks must still be robust to environmental perturbation and responsive to intentional modulation. In this
thesis, I describe red pigment-concentrating hormone (RPCH) acting
as a neuromodulator on a computational model of a rhythmic motor
circuit.

### [Agency, Consent, Schizophrenia](https://github.com/alec-hoyland/history-of-ideas-thesis/blob/master/template_Article.pdf)

*History of Ideas minor thesis at Brandeis University*

I presented this paper at a mini-conference on
the intersection of genealogy, science, and social justice
held at Brandeis University. What philosophical and sociological
conclusions can we gather from current neuroscientific research? This work is broken into three
parts. First we consider the scientific and philosophical implications of anomalous self-experience
in schizophrenia. Second, we consider an examination of agency in schizophrenic individuals.
Finally, we consider the implications of the first and second sections on issues of social justice
concerning sexual consent.

## Publications

\textinput{pubs.md}

<!-- This section is meant as a refresher if you're new to Franklin.
Have a look at both how the website renders and the corresponding markdown (`index.md`).
Modify at will to get a feeling for how things work!

Ps: if you want to modify the header or footer or the general look of the website, adjust the files in
* `src/_css/` and
* `src/_html_parts/`. -->
<!-- 
## The base with Markdown

The [standard markdown syntax](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet) can be used such as titles using `#`, lists:

* element with **bold**
* element with _emph_

or code-blocks `inline` or with highlighting (note the `@def hascode = true` in the source to allow [highlight.js](https://highlightjs.org/) to do its job):

```julia
abstract type Point end
struct PointR2{T<:Real} <: Point
    x::T
    y::T
end
struct PointR3{T<:Real} <: Point
    x::T
    y::T
    z::T
end
function len(p::T) where T<:Point
  sqrt(sum(getfield(p, η)^2 for η ∈ fieldnames(T)))
end
```

You can also quote stuff

> You must have chaos within you to ...

or have tables:

| English         | Mandarin   |
| --------------- | ---------- |
| winnie the pooh | 维尼熊      |

Note that you may have to do a bit of CSS-styling to get these elements to look the way you want them (the same holds for the whole page in fact).

### Symbols and html entities

If you want a dollar sign you have to escape it like so: \$, you can also use html entities like so: &rarr; or &pi; or, if you're using Juno for instance, you can use `\pi[TAB]` to insert the symbol as is: π (it will be converted to a html entity).[^1]

If you want to show a backslash, just use it like so: \ ; if you want to force a line break, use a ` \\ ` like \\ so (this is on a new line).[^blah]

If you want to show a backtick, escape it like so: \` and if you want to show a tick in inline code use double backticks like ``so ` ...``.

Footnotes are nice too:

[^1]: this is the text for the first footnote, you can style all this looking at `.fndef` elements; note that the whole footnote definition is _expected to be on the same line_.
[^blah]: and this is a longer footnote with some blah from veggie ipsum: turnip greens yarrow ricebean rutabaga endive cauliflower sea lettuce kohlrabi amaranth water spinach avocado daikon napa cabbage asparagus winter purslane kale. Celery potato scallion desert raisin horseradish spinach carrot soko.

## Basic Franklin extensions

### Divs

It is sometimes useful to have a short way to make a part of the page belong to a div so that it can be styled separately.
You can do this easily with Franklin by using `@@divname ... @@`.
For instance, you could want a blue background behind some text.

@@colbox-blue
Here we go! (this is styled in the css sheet with name "colbox-blue").
@@

Since it's just a `<div>` block, you can put this construction wherever you like and locally style your text.

### LaTeX and Maths

Essentially three things are imitated from LaTeX

1. you can introduce definitions using `\newcommand`
1. you can use hyper-references with `\eqref`, `\cite`, ...
1. you can show nice maths (via KaTeX)

The definitions can be introduced in the page or in the `config.md` (in which case they're available everywhere as opposed to just in that page).
For instance, the commands `\scal` and `\R` are defined in the config file (see `src/config.md`) and can directly be used whereas the command `\E` is defined below (and therefore only available on this page):

\newcommand{\E}[1]{\mathbb E\left[#1\right]}

Now we can write something like

$$  \varphi(\E{X}) \le \E{\varphi(X)}. \label{equation blah} $$

since we've given it the label `\label{equation blah}`, we can refer it like so: \eqref{equation blah} which can be convenient for pages that are math-heavy.

In a similar vein you can cite references that would be at the bottom of the page: \citep{noether15, bezanson17}.

**Note**: the LaTeX commands you define can also incorporate standard markdown (though not in a math environment) so for instance let's define a silly `\bolditalic` command.

\newcommand{\bolditalic}[1]{_**!#1**_} <!--_ ignore this comment, it helps atom to not get confused by the trailing underscore when highlighting the code but is not necessary.-->
<!-- 
and use it \bolditalic{here for example}.

Here's another quick one, a command to change the color:

\newcommand{\col}[2]{~~~<span style="color:~~~#1~~~">~~~!#2~~~</span>~~~}

This is \col{blue}{in blue} or \col{#bf37bc}{in #bf37bc}.

### A quick note on whitespaces

For most commands you will use `#k` to refer to the $k$-th argument as in LaTeX.
In order to reduce headaches, this forcibly introduces a whitespace on the left of whatever is inserted which, usually, changes nothing visible (e.g. in a math settings).
However there _may be_ situations where you do not want this to happen and you know that the insertion will not clash with anything else.
In that case, you should simply use `!#k` which will not introduce that whitespace.
It's probably easier to see this in action:

\newcommand{\pathwith}[1]{`/usr/local/bin/#1`}
\newcommand{\pathwithout}[1]{`/usr/local/bin/!#1`}

* with: \pathwith{script.jl}, there's a whitespace you don't want 🚫
* without: \pathwithout{script.jl} here there isn't ✅

### Raw HTML

You can include raw HTML by just surrounding a block with `~~~`.
Not much more to add.
This may be useful for local custom layouts like having a photo next to a text in a specific way.

~~~
<div class="row">
  <div class="container">
    <img class="left" src="/assets/rndimg.jpg">
    <p>
    Marine iguanas are truly splendid creatures. They're found on the Gálapagos islands, have skin that basically acts as a solar panel, can swim and may have the ability to adapt their body size depending on whether there's food or not.
    </p>
    <p>
    Evolution is cool.
    </p>
    <div style="clear: both"></div>      
  </div>
</div>
~~~

**Note 1**: again, entire such blocks can be made into latex-like commands via `\newcommand{\mynewblock}[1]{...}`.

**Note 2**: whatever is in a raw HTML block is *not* further processed (so you can't have LaTeX in there for instance). A partial way around this is to use `@@...` blocks which *will* be recursively parsed. The following code gives the same result as above with the small difference that there is LaTeX being processed in the inner div.

@@row
@@container
@@left ![](/assets/rndimg.jpg) @@
@@
Marine iguanas are **truly splendid** creatures. They're not found in equations like $\exp(-i\pi)+1$. But they're still quite cool.
~~~
<div style="clear: both"></div>
~~~
@@

## Pages and structure

Here are a few empty pages connecting to the menu links to show where files can go and the resulting paths. (It's probably best if you look at the source folder for this).

* [menu 1](/menu1/)
* [menu 2](/menu2/)
* [menu 3](/menu3/)

## References (not really)

* \biblabel{noether15}{Noether (1915)} **Noether**,  Körper und Systeme rationaler Funktionen, 1915.
* \biblabel{bezanson17}{Bezanson et al. (2017)} **Bezanson**, **Edelman**, **Karpinski** and **Shah**, [Julia: a fresh approach to numerical computing](https://julialang.org/research/julia-fresh-approach-BEKS.pdf), SIAM review 2017.

## Header and Footer

As you can see here at the bottom of the page, there is a footer which you may want on all pages but for instance you may want the date of last modification to be displayed.
In a fashion heavily inspired by [Hugo](https://gohugo.io), you can write things like

```html
Last modified: {{ fill fd_mtime }}.
```

(cf. `src/_html_parts/page_foot.html`) which will then replace these braces with the content of a dictionary of variables at the key `fd_mtime`.
This dictionary of variables is accessed locally by pages through `@def varname = value` and globally through the `config.md` page via the same syntax.

There's a few other such functions of the form `{{fname p₁ p₂}}` as well as support for conditional blocks. If you wander through the `src/_html_parts/` folder and its content, you should be able to see those in action. -->
