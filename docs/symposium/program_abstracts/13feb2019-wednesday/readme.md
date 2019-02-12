Wednesday Feb 13 (Pippard lecture theatre, Sheffield Building, level 5)
---

# (900) Sebastian van Strien (Imperial College London, svanstrien@gmail.com)
## Title: Reinforcement learning in the multi-agent setting
> Abstract: Reinforcement learning is where a player keeps track of the success of
actions in the past and chooses new actions accordingly. In the setting of a
stationary stochastic environment such models are well understood. However,
when other players also use some sort of learning then this leads to interesting and
complicated dynamics. In this talk I will focus on a few specific models, such as
Q learning. I will show that, depending on the precise implementation of the
model, one obtains dynamics similar to that of a biological population model
(replicator-like systems) but also chaotic Lorenz-like behaviour. This talk is based
on joint work with Björn Winckler.

Sebastian van Strien
http://wwwf.imperial.ac.uk/~svanstri/
https://scholar.google.co.uk/citations?user=zHT5hr4AAAAJ&hl=en



# (930) Qianxiao Li (Institute of High Performance Computing, Agency for Science, Technology and Research, Singapore, liqix@ihpc.a-star.edu.sg)
## Title: A Dynamical Systems and Optimal Control Approach to Deep Learning
> Abstract: Depsite its empirical success, deep learning lacks a concrete
mathematical framework to study its algorithmic and theoretical properties. In this
talk, we present a theoretical framework to study deep learning that draws on
connections with dynamical systems and optimal control. In particular, supervised
deep learning can be interpreted as an optimal control problem in a suitable
“mean-field” sense [1]. This allows us to characterize precisely the optimality
conditions of deep neural networks using maximum principles, as well as partial
differential equations. Besides theoretical analysis, we will also discuss 
how theoptimal control approach gives rise to novel training algorithms that are amenable
to theoretical analysis and are effective in practice [2,3].



http://ww1.math.nus.edu.sg/staff.aspx?f=adjunct
https://scholar.google.com/citations?user=zLgReYoAAAAJ&hl=en



# (1000) Ioannis Panageas (SUTD, panageasj@gmail.com)
## Title: The Limit Points of (Optimistic) Gradient Descent in Min-Max Optimization
> Abstract: Motivated by applications in Optimization, Game Theory, and the
training of Generative Adversarial Networks, the convergence properties of first
order methods in min-max problems have received extensive study. It has been
recognized that they may cycle, and there is no good understanding of their limit
points when they do not. When they converge, do they converge to local min-max
solutions? We characterize the limit points of two basic first order methods,
namely Gradient Descent/Ascent (GDA) and Optimistic Gradient Descent Ascent
(OGDA). We show that both dynamics avoid unstable critical points for almost
all initializations. Moreover, for small step sizes and under mild assumptions, the
set of OGDA-stable critical points is a superset of GDA-stable critical
points, which is a superset of local min-max solutions (strict in some cases). The
connecting thread is that the behavior of these dynamics can be studied from a
dynamical systems perspective. Joint work with Costis Daskalakis.



https://panageas.github.io/
https://istd.sutd.edu.sg/people/faculty/ioannis-panageas
https://scholar.google.com/citations?user=5NiFWuwAAAAJ&hl=en





# (1100) Georgios Piliouras (SUTD, georgios.piliouras@gmail.com)
## Title: Online Optimization in Zero-Sum Games: A Dynamical Systems Approach
> Abstract: Zero-Sum games are basic staples of game theory. Their study is also
closely connected with machine learning challenges such as training Generative
Adversarial Networks (GANs). Online gradient descent and multiplicative
weights in such settings can be interpreted as Hamiltonian dynamics. In zero-sum
games Poincaré recurrence and novel no-regret bounds can be established as a
result both in discrete and continuous-time.


Georgios Piliouras
http://people.sutd.edu.sg/~georgios/
https://scholar.google.com/citations?user=Ar4h7jkAAAAJ&hl=en


# (1130) Panos Parpas (Imperial College London, panos.parpas@imperial.ac.uk) 
## Title: Predict Globally, Correct Locally: A dynamical systems view of distributed multilevel learning
> Abstract: Recently several authors proposed a dynamical systems view of modern
neural network architectures. This point of view enables the use of a rigorous
mathematical framework to study essential properties of neural networks such as
stability, and convergence. In this talk, we adopt the same point of view, but our
aim is different. In particular, we show how to take advantage of the dynamical
system point of view to develop a new class of distributed optimization
algorithms based on a predictor-corrector framework. In the prediction phase, the
algorithm propagates the dynamics of a coarse neural network. The corrector
phase uses the results from the prediction phase to correct the weights of the 
fullnetwork in a distributed fashion. We study the worst case convergence rate of the
proposed algorithm and report numerical results from benchmark test problems.


Panos Parpas
https://www.imperial.ac.uk/people/panos.parpas
https://www.doc.ic.ac.uk/~pp500/
https://scholar.google.co.uk/citations?user=yXcvHysAAAAJ&hl=en


# (1200) Pascal Bianchi (Télécom ParisTech, pascal.bianchi@telecom-paristech.fr)
## Title: Convergence of the ADAM algorithm from a Dynamical System Viewpoint
> Abstract: Adam is a popular variant of the stochastic gradient descent for finding
a local minimizer of a function. The objective function is unknown but a random
estimate of the current gradient vector is observed at each round of the algorithm.
This paper investigates the dynamical behavior of Adam when the objective
function is non-convex and differentiable. We introduce a continuous-time
version of Adam, under the form of a non-autonomous ordinary differential
equation (ODE). The existence and the uniqueness of the solution are established,
as well as the convergence of the solution towards the stationary points of the
objective function. It is also proved that the continuous-time system is a relevant
approximation of the Adam iterates, in the sense that the interpolated Adam
process converges weakly to the solution to the ODE.


Pascal Bianchi
https://bianchi.wp.imt.fr/
https://scholar.google.fr/citations?user=dy4EjhAAAAAJ&hl=fr




# (1230) Pierre-Yves Masse (ENS Cachan, PIERRE-YVES.MASSE@ens-cachan.fr)
## Title: Convergence of Online Training Algorithms for Recurrent Systems
> Abstract: Neural networks may be represented as parameterised dynamical
systems: the set of activities of the neurons is the state of the system, the weights
of the network are the parameter of the system, and the forward pass is the
transition operator of the system. This representation holds in particular for the
recurrent architectures, which aim at modelling time dependent data (like for
instance climatic time series). Mainstream algorithms used to train these systems
proceed by gradient descent on the parameter, as Truncated Backpropagation
Through Time (TBTT), or the Real-Time Recurrent Learning algorithm (RTRL),
which runs online. However, though they have been known for some decades, no
proof of convergence was available as of today, up to our best knowledge. Our
work thus organises as follows. We provide a mathematical representation of a
parameterised dynamical system, gradient-descent optimisation algorithm, in a
nonlinear setting. Under natural hypotheses on the components of this
representation, we prove the local convergence of the training procedure. We then
establish that TBTT and RTRL fit into this framework, and therefore prove their
convergence. In particular, we devise a criterium of optimality for families of time
dependent losses, which extends the classical hypotheses of Robbins and Monro.
The RTRL algorithm works online, at the expense of great memory costs needed
to maintain a huge tensor. The UORO algorithm circumvents this issue by
approximating this tensor with a random, unbiased, rank-one tensor. We prove
that, with probability arbitrarily close to one provided the initial step size of the
descent is small enough, UORO converges to the same optimum as RTRL.



http://pierre-yves-masse.pagesperso-orange.fr/sources/home_profe_page.html




# (1400) Robert MacKay (University of Warwick, R.S.MacKay@warwick.ac.uk)
## Title: A Gaussian process to detect underdamped modes of oscillation
> Abstract: In many domains of data science, it is desired to detect modes of
oscillation of a system, including estimating their frequency, damping rate, mode
shape and amplitude. Here a Gaussian process solution is presented.


Robert MacKay
https://warwick.ac.uk/fac/sci/maths/people/staff/robert_mackay/
https://scholar.google.co.uk/citations?user=BphNXV8AAAAJ&hl=en




# (1430) Erik Bollt (Clarkson, ebollt@clarkson.edu)
## Title: How Entropic Regression Beats the Outliers Problem in Nonlinear System Identification
> Abstract: System identification (SID) is central in science and engineering
applications whereby a general model form is assumed, but active terms and
parameters must be inferred from observations. Virtually all methods for SI rely
on optimizing some metric-based cost function that describes how a model fits
observational data. The most common cost function employs a Euclidean metric
and leads to a least squares estimate, while recently it becomes popular to also
account for model sparsity such as in compressed sensing and Lasso methods.
While the effectiveness of these methods has been demonstrated in various model
systems, it remains unclear whether SID can be accomplished under more realistic
scenarios where there may be large noise and outliers. We show that
sparsity-focused methods such as compressive sensing, when used in the presence
of noise, may result in “over sparse” solutions that are brittle to outliers. In fact,
metric-based methods are prone to outliers because outliers by nature have an
unproportionally large influence. To mitigate such issues of large noise and
outliers encountered in practice, we develop an entropic regression approach for
nonlinear SID, whereby true model structures are identified based on relevance in
reducing information flow uncertainty, not necessarily sparsity. The use of
information- theoretic measures as opposed to a metric-based cost function has
the unique advantage, due to the asymptotic equipartition property of probability
distributions, that outliers and other low-occurrence events are naturally and
intrinsically de-emphasized.

References: [1] https://webspace.clarkson.edu/~ebollt/Papers/poCSEmain-180819-final.pdf


Erik Bollt
https://webspace.clarkson.edu/~ebollt/
https://scholar.google.com/citations?user=EnJzqhAAAAAJ&hl=en




# (1500) Juan-Pablo ORTEGA (Universität Sankt Gallen, juan-pablo.ortega@unisg.ch)
## Title: The universality problem in dynamic machine learning.
> Abstract: The universal approximation properties with respect to $L ^\infty$ and
$L ^p$-type criteria of three important families of reservoir computers with
stochastic discrete-time semi-infinite inputs are shown. First, it is proved that 
linear reservoir systems with either polynomial or neural network readout maps
are universal. More importantly, it is proved that the same property holds for two
families with linear readouts, namely, state-affine systems and echo state
networks, which are the most widely used reservoir systems in applications. The
linearity in the readouts is a key feature in supervised machine learning
applications. It guarantees that these systems can be used in high-dimensional
situations and in the presence of large datasets. These results are illustrated with
applications to the forecasting of high-dimensional financial realized covariance
matrices.


Juan-Pablo Ortega
https://juan-pablo-ortega.com/
https://www.alexandria.unisg.ch/persons/6769
https://scholar.google.com/citations?user=SoBQqSwAAAAJ&hl=en







# (1530) Axel Hutt (German Meteorological Service, digitalesbad@gmail.com)
## Title: Recurrence structure analysis: revealing underlying metastable attractor dynamics from time series
> Abstract: Complex systems may exhibit intermittent temporal dynamics, such as
transitions between slow and fast dynamics. Temporal sequences of such
metastable attractors occur in biology, e.g. in bird songs, in neuroscience, e.g.
as event-related components, or in the atmosphere as chaotic attractors. In order to
understand and derive models of complex systems, it is insightful to compute the
recurrence structure of observed time series. To this end, recurrence structure
analysis (RSA) provides a set of tools to identify recurrent states in time
series reflecting metastable attractors in the underlying complex system. RSA
utilises recurrence plots originally invented by Hernri Poincare about 100 years
ago and derives symbolic sequences from recurrence plots and
corresponding transition probability models. Such models allow to compute the
optimal recurrence box width where the recurrence is detected. To our best
knowledge, this optimality criterion is one of the first to determine an optimal
recurrence box width. Applications to well-known models, such as the
Lorentz-attractor, and brain signals observed during cognitive experiments
illustrate underlying metastable attractors. Moreover, application to intracranial
animal brain signals observed under anaesthesia reveals a changing degree of
recurrence complexity in the brain with the anaesthetic depth.

References: 

Hutt and P. beim Graben, Sequences by metastable attractors: interweaving
dynamical systems and experimental data, Frontiers in Applied Mathematics and
Statistics 3:11 (2017)

P. beim Graben, K. K. Sellers, F. Fröhlich and A. Hutt, Optimal estimation of recurrence
structures from time series, Europhysics Letters 114(3): 38003 (2016)

P. beim Graben and A. Hutt, Detecting event-related recurrences by symbolic analysis:
Applications to human language processing, Philosphical Transactions of the
Royal Society A 373:20140089 (2015)

P. beim Graben and A. Hutt, Detecting metastable states of dynamical systems by
recurrence-based symbolic dynamics, Physical Review Letters 110, 154101
(2013)


Axel Hutt
http://www.geocities.ws/digitalbath/
https://scholar.google.com/citations?user=PDupwHQAAAAJ&hl=fr






