


# (0915) Mauro Maggioni (JHU, mauro@math.jhu.edu)
## Title: Geometric methods in statistical learning problems for (stochastic) dynamical systems
> Abstract: We discuss methods that measure and exploit quantitative geometric
properties of high-dimensional data to perform inference and statistical estimation
tasks, avoiding the curse of dimensionality. Examples include stochastic systems
in high-dimensions, which have a large number of fast degrees of freedom but a
relatively small number of slower, ``effective'' degrees of freedom, which are
unknown. We introduce geometric-based techniques for learning such unknown
degrees of freedom, and learn surrogate, lower-dimensional dynamical systems
cheaply, but with theoretical guarantees on their performance in predicting
large-time properties of the system. We will also discuss the problem of learning
the influence function in interacting agent systems.



https://mauromaggioni.duckdns.org/
https://scholar.google.com/citations?user=e6JywScAAAAJ





# (1000) Tim Sauer (GMU, tsauer@gmu.edu)
##Title: Consistent manifold learning from data
> Abstract: Characterizing attracting sets of dynamical systems is a key concern for
data-driven algorithms. We take a geometric approach by assuming the data
points lie on a Riemannian manifold, and reconstruct the Laplace-Beltrami
operator. In particular, we show how build a graph Laplacian that converges,
pointwise and spectrally, to the continuous operator in the large data limit. If this
can be achieved, geometric and topological information about the manifold can be
inferred from a single graph. Since real data is typically sampled irregularly, it is
necessary to introduce a criterion called Continuous k-Nearest Neighbors (CkNN)
for the graph construction that implies convergence for arbitrary sampling.



http://math.gmu.edu/~tsauer/
https://scholar.google.com/citations?user=O4H_dNQAAAAJ&hl=en


# (1100) Michael Dellnitz (Paderborn, dellnitz@upb.de), Andreas Bittracher (FU Berlin, bittracher@mi.fu-berlin.de) and Sebastian Peitz (Paderborn, speitz@math.upb.de)
## Title: Low-dimensional data-based surrogate models for analysis, simulation and
control of high-dimensional dynamical systems
> Abstract: In this presentation, we discuss the importance of low-dimensional
coordinates for the efficient analysis, simulation and control of high- or
infinite-dimensional systems, and we present data-based methods for their
computation and use in control schemes.The first part is concerned with the numerical computation of low-dimensional
attractors and manifolds using embedding-techniques according to Takens, Sauer
et al. and Robinson. If the system under consideration possesses a
low-dimensional structure, then a generic low-dimensional observable of the
system can be used to obtain a one-to-one image of the essential dynamics. In
combination with set-oriented numerical algorithms, this is exploited in order to
compute attractors and unstable manifolds of partial differential equations.
In the second part, we then focus on the task of obtaining dynamically meaningful
coordinates for the system's essential dynamics from data. The information about
the system's longtime behaviour is contained within the geometric structure of the
so-called transition manifold, a low-dimensional object in the space of probability
densities. By embedding this manifold into more tangible spaces, either again
through generic low-dimensional observables or by kernel embedding techniques,
its structure is made accessible to a wide variety of machine learning algorithms,
which can then be used to compute optimal essential coordinates and other
characteristic variables. This approach has proven especially useful in the
conformational analysis of high-dimensional biomolecular systems.
Finally, in part three we will construct a low-dimensional surrogate model for a
set of meaningful coordinates using the Koopman operator. The Koopman
operator is a linear but infinite-dimensional operator describing the dynamics of
observables. Using numerical methods such as Extended Dynamic Mode
Decomposition (EDMD), we can construct a finite-dimensional approximation of
the operator which yields a highly efficient linear reduced model. Using a recent
convergence result for EDMD, optimality of the resulting reduced control
problem can be guaranteed. The efficiency of this approach is shown for the
Burgers equation as well as the flow around a cylinder governed by the
Navier-Stokes equations.



Michael Dellnitz
https://scholar.google.de/citations?user=8ZZDReEAAAAJ&hl=de

Andreas Bittracher
https://scholar.google.com.au/citations?user=uMjQGKgAAAAJ&hl=en

Dr. Sebastian Peitz
https://math.uni-paderborn.de/ag/lehrstuhl-fuer-angewandte-mathematik/persoenliche-webseiten/sebastian-peitz/





# (1200) Markus Abel (​ Ambrosys, ​ markus.abel@ambrosys.de)
## Title: Machine Learning for the control of complex systems.
> Abstract: The control of complex systems may be as complex as the system
considered. We have developed a software prototype to learn a control law in
situations where no analytical control can be found. It is developed for
evolutionary optimization and symbolic regression. In this contribution we
present two systems where we apply our methodology: a network with possibly
chaotic dynamics controlled to synchronous behaviour of its parts, and an airfoil
controlled to show high-lift.


Markus Abel
https://scholar.google.com/citations?user=Rus3tn0AAAAJ&hl=de




# (1230) Kevin McGoff (UNCC, kmcgoff1@uncc.edu)
## Title: Empirical risk minimization over dynamical models
> Abstract: This talk concerns the fitting of a parametrize family of dynamical
models to an observed real-valued stochastic process using empirical risk
minimization. The limiting behavior of the minimum risk parameters is studied in
a general setting. We establish a general convergence theorem for minimum risk
estimators and ergodic observations. We then study conditions under which
empirical risk minimization can effectively separate the signal from the noise in
various observational noise models. The key, necessary condition in the latter
results is that the family of dynamical models has limited complexity, which is
quantified through a notion of entropy for families of infinite sequences.


https://clas-math.uncc.edu/kevin-mcgoff/research/


# (1400) Eniko Szekely (EPFL, eniko.szekely@epfl.ch)
## Title: Data-driven kernel methods for dynamical systems with application to atmosphere ocean science
> Abstract: Datasets generated by dynamical systems are often high-dimensional,
but they only display a small number of patterns of interest. The underlying
low-dimensional structure governing such systems is generally modeled as a
manifold, and its intrinsic geometry is well described by local measures that vary
smoothly on the manifold, such as kernels, rather than by global measures, such
as covariances. In this talk, a kernel-based nonlinear dimension reduction method,
namely nonlinear Laplacian spectral analysis (NLSA), is used to extract a reduced
set of basis functions that describe the large-scale behavior of the dynamical
system. These basis functions are the leading Laplace-Beltrami eigenfunctions of
a discrete Laplacian operator. They can be further employed as predictors to
quantify the regime predictability of a signal of interest using clustering and
information-theoretic measures. In this talk, NLSA will be employed to extract
physically meaningful spatiotemporal patterns from organized tropical convection
covering a wide range of timescales, from interannual to annual, semiannual,
intraseasonal and diurnal scales.



* https://cims.nyu.edu/~eszekely/
* https://scholar.google.com/citations?user=usZazjgAAAAJ&hl=en



# (1430) Isao Ishikawa (Riken,  isao.ishikawa@riken.jp )
## Title: Metric on nonlinear dynamical systems with Perron-Frobenius operators
> Abstract: The development of a metric for structural data is a long-term problem
in pattern recognition and machine learning. In my talk, we introduce a general
framework to construct a metric for comparing nonlinear dynamical systems that
is defined with Perron-Frobenius operators in reproducing kernel Hilbert spaces.
Our metric includes the existing fundamental metrics for dynamical systems,
which are basically defined with principal angles between some
appropriately-chosen subspaces, as its special cases. We also describe the
estimation of our metric from finite data. We empirically illustrate our metric with
an example of rotation dynamics in a unit disk in a complex plane, and evaluate
the performance with real-world time-series data.



Kenichi Bannai 
https://aip.riken.jp/labs/generic_tech/math_sci/
https://www.youtube.com/user/KENICHIBANNAI/featured



# (1500) Bernard Haasdonk (Stuttgart, haasdonk@mathematik.uni-stuttgart.de), Gabriele Santin (Stuttgart) and T. Brunnette (Stuttgart)
## Title: Accelerating Implicit Integrators for Parametric ODE Systems by Greedy Kernel Approximation
> Abstract: In this presentation, we want to demonstrate how kernel-based
approximation methods can contribute to a paradigm of “Data-based Numerical
Mathematics”. Parametric MOR has intensively focussed on approximately
solving parametric high-dimensional PDE and ODE systems during the last
decades. We want to widen this view to more general parametric problems in
numerical mathematics, that might benefit from the same concept: 1) gathering
data from solving some specific problem instantiations, 2) processing this data
and obtain a surrogate that can be used for 3) rapidly solving or approximating the
original parametric problem. We will first review some basic tools in kernel
approximation for the reconstruction of high-dimensional functions, both in input
and output. These methods allow to construct approximants to general target
functions defined on arbitrary domains by means of scattered samples, i.e.,
without requiring any structure on the sampling locations. We will then focus on
greedy algorithms, in particular the VKOGA [3], which constructs approximants
based on a small subset of the data sites, thus being faster to evaluate, while still
providing a good accuracy, which can even be proven to be quasi-optimal in some
cases [2]. The proof actually makes elegant use of known results for Reduced
Basis Methods. These theoretical and computational features make greedy
kernel-based algorithms particularly attractive for the construction of surrogate
models. Then we will exemplify an application in data-driven numerical
mathematics, namely acceleration of implicit ODE integrators by forecasting. A
set of state trajectories precomputed with a high-accuracy ODE solver is used to
train a kernel model which predicts the next point in the trajectory as a function of
the previous one. This model is cheap to evaluate, and it is used in the online
phase to provide a good initialization point for the nonlinear solver of the implicit
integrator. The accuracy of the surrogate model results in a significant reduction
of the number of required steps of the solver, thus providing an overall speedup of
the full simulation. Despite the acceleration, the method maintains the accuracy of
the original model. Although the method can be potentially applied to a large
variety of solvers and different ODEs, we will present in detail its use with the
implicit Euler method (VKOGA-IE) in the solution of e.g., the Burgers equation,
which is an important test case to demonstrate the method’s features [1].

References
[1] T. Brunnette, G. Santin, and B. Haasdonk. Greedy kernel methods for
accelerating implicit inte- grators for parametric ODEs. In Proc.
ENUMATH 2017, 2018. Submitted.
[2] G. Santin and B. Haasdonk. Convergence rate of the data-independent
P-greedy algorithm in kernel-based approximation. Dolomites Research
Notes on Approximation, 10:68–78, 2017.
[3] D. Wirtz and B. Haasdonk. A vectorial kernel orthogonal greedy algorithm.
Dolomites Research Notes on Approximation, 6:83–100, 2013.



Bernard Haasdonk
https://www.ians.uni-stuttgart.de/anm/
https://scholar.google.com/citations?user=8clgm98AAAAJ&hl=de


Gabriele Santin
https://scholar.google.co.uk/citations?user=WG9oe0wAAAAJ&hl=en
https://www.ians.uni-stuttgart.de/institute/team/Santin-00001/




# (1530) Boumediene Hamzi (Imperial College London, boumediene.hamzi@gmail.com)
## Title: Kernel Methods for Dynamical Systems
> Abstract: We introduce a data-based approach to estimating key quantities which
arise in the study of nonlinear autonomous, control and random dynamical
systems. Our approach hinges on the observation that much of the existing linear
theory may be readily extended to nonlinear systems - with a reasonable
expectation of success- once the nonlinear system has been mapped into a high or
infinite dimensional Reproducing Kernel Hilbert Space. In particular, we develop
computable, non-parametric estimators approximating controllability andobservability energies and Lyapunov functions for nonlinear systems. We apply
this approach to the problem of model reduction of nonlinear control systems. It is
also shown that the controllability energy estimator provides a key means for
approximating the invariant measure of an ergodic, stochastically forced nonlinear
system. We also show how kernel methods can be used to detect critical
transitions for some multi scale dynamical systems. Finally, we show how kernel
methods can be used to approximate center manifolds for nonlinear ODEs. This
is joint work with Jake Bouvrie (MIT, USA), Peter Giesl (University of Sussex,
UK), Christian Kuehn (TUM, Munich/Germany), Sameh Mohamed (SUTD,
Singapore), Martin Rasmussen (Imperial College London), Kevin Webster
(Imperial College London), Bernard Hasasdonk, Gabriele Santin and Dominik
Wittwar (University of Stuttgard).
References: [1] https://arxiv.org/abs/1011.2952
[2] https://arxiv.org/abs/1108.2903 ( http://aimsciences.org/article/doi/10.3934/jcd.2017001  )
[3] https://arxiv.org/abs/1204.0563 ( https://epubs.siam.org/doi/abs/10.1137/14096815X )
[4]  https://arxiv.org/abs/1601.01568
[5] https://arxiv.org/abs/1804.09415
[6]  https://arxiv.org/abs/1810.11329





https://scholar.google.com/citations?user=2goK6M0AAAAJ&hl=en



# (1730) Edward OTT (UMD, edott@umd.edu)
## Title: Machine Learning for Prediction and Analysis of Chaotic Dynamics (Including that of Large Spatiotemporally Chaotic Systems)
> ABSTRACT: We first review the basic idea of using machine learning to to
construct from time series data a closed-loop, autonomous, dynamical system that
mimics the dynamics of the unknown system that generated the data and predicts
the future evolution of the measurements [1]. Using the reservoir computing type
of machine learning, we then present examples of extensions and applications of
this idea. These will include a parallel implementation enabling forecasting of the
states very large spatiotemporally chaotic systems with local interactions [2], a
hybrid scheme where a knowledge-based model component is combined with a
limited-size machine learning component to achieve prediction performance much
better than that of either of the components acting alone [3], Kalman filtering by a
purely machine learning approach and by a hybrid machine-learning /
knowledge-based approach, etc. Finally, we will use concepts from nonlinear
dynamics to obtain understanding and conditions for effective operation of
closed-loop machine learning prediction systems [4].

[1] Jaeger, Haas, Science (2004).
[2] Pathak, Hunt, Girvan, Lu, Ott, Phys Rev Lett (2018).
[3] Pathak, Wikner, Fussell, Chandra, Hunt, Girvan. Ott, CHAOS (2018).
[4] Lu, Hunt, Ott, CHAOS (2018).


http://www.chaos.umd.edu/personnel/ott.html
https://scholar.google.com/citations?user=z7boxkkAAAAJ&hl=en




# POSTERS


# Jehan AlSwaihli (Reading)
## Title: Kernel Reconstruction for Delayed Neural Field Equations
> Abstract: Modelling the dynamical systems mathematically is a challenge and an
inspiration to researchers from different fields such as physics, mathematics,
engineering, computer science, medical science and neuroscience. In recent years,
contributions from those fields had convergent together to improve modelling and
understanding of dynamical systems.
In this contribution, we provide an integral equation approach to reconstruct the
kernel of a delay neural field equation. We reformulate the inverse problem into a
family of integral equations of the first kind. Then, due to the ill-posedness of this
problem, we employ spectral regularization techniques for its stable solution.
Numerical examples are provided to support our discussion.	


https://scholar.google.co.uk/citations?user=IL4zBg8AAAAJ&hl=en




# Djalel Benbouzid and Maximilian Karl (Volkswagen)
## Title: Unsupervised Real-Time Control through Variational Empowerment
> Abstract:

https://argmax.ai/team/djalel-benbouzid/
https://scholar.google.com/citations?user=noekAeoAAAAJ&hl=en



# Elhadj Benkhelifa and Siyakha Mthunzi (Staffordshire University)
## Title: Prey-Inspired Dynamics for Survivability in Cloud Systems
> Abstract: Cloud computing is increasingly relied upon at micro and macro-level
critical systems, service assurance becomes a key component of secure, reliable
and resilient service provision. Survivability is hence emphasised as the desirable
capacity to meet the service provisioning mission. Currently, Service Level
Objectives (SLA) are guaranteed by controlling resources that are already used by
cloud providers (substrate networking). However, these are inefficient due their
deterministic approach. The combination tenant concurrency, heterogeneity of
resource and uncertain, unobserved or unobservable risks (UUUR) characterise
the unpredictability and complexity of cloud. Effective survivability in dynamic
environments requires optimal decision-making on survivability objectives on the
fly. Decision-making requires monitoring and is particularly critical but majorly
challenging where information is not known with certainty and future systems
behaviours are unpredictable. For cloud-driven/cloud-based critical systems, it is
optimally strategic that a monitoring system produce unambiguous and precise
system information to facilitate optimal strategic responses under UUUR. In this
work, a novel approach is presented that is robust for survivability of cloud
systems under UUUR. Our proposition consists of a prey-inspired (Pi)
survivability feedback-communication-control loop termel
SDSSurv(sense-decide-act) to dynamically actuate escalating countermeasures, akin to
escalating anti-predation responses in prey animals. Partially Observable MDP
achieve the optimal decision points by extending the observability element of
MDP, i.e. inferred partial information to provide probabilistic information about
future states (accurately premised on inference, observation and observability in
survival prey animals). Cloud service provisioning survivability cloud benefit
from dynamic decision-making and strategic escalating responses to UUURs.


Elhadj Benkhelifa
https://scholar.google.co.uk/citations?user=KylI32wAAAAJ&hl=en

Siyakha N Mthunzi
https://scholar.google.co.uk/citations?user=kh6ubIkAAAAJ&hl=en




# Anthony Caterini and Dino Sejdinovic (Oxford)
## Title: Hamiltonian Variational Auto-Encoder
> Abstract: Variational Auto-Encoders (VAEs) have become very popular
techniques to perform inference and learning in latent variable models as they
allow us to leverage the rich representational power of neural networks to obtain
flexible approximations of the posterior of latent variables as well as tight
evidence lower bounds (ELBOs). Combined with stochastic variational inference,
this provides a methodology scaling to large datasets. However, for this
methodology to be practically efficient, it is necessary to obtain low-variance
unbiased estimators of the ELBO and its gradients with respect to the parameters
of interest. While the use of Markov chain Monte Carlo (MCMC) techniques such
as Hamiltonian Monte Carlo (HMC) has been previously suggested to achieve
this [23, 26], the proposed methods require specifying reverse kernels which have
a large impact on performance. Additionally, the resulting unbiased estimator of
the ELBO for most MCMC kernels is typically not amenable to the
reparameterization trick. We show here how to optimally select reverse kernels in
this setting and, by building upon Hamiltonian Importance Sampling (HIS) [17],
we obtain a scheme that provides low-variance unbiased estimators of the ELBO
and its gradients using the reparameterization trick. This allows us to develop a
Hamiltonian Variational Auto-Encoder (HVAE). This method can be
reinterpreted as a target-informed normalizing flow [20] which, within our
context, only requires a few evaluations of the gradient of the sampled likelihood
and trivial Jacobian calculations at each iteration.

Anthony Caterini
https://scholar.google.co.uk/citations?user=34sCXQEAAAAJ&hl=en
https://twitter.com/AnthonyCaterini


Dino Sejdinovic
https://scholar.google.co.uk/citations?user=v8Dg1lIAAAAJ&hl=en
https://twitter.com/sejDino


# Karim Cherifi (Boumerdes, Algeria)
## Title: Introduction to Port Hamiltonian systems for realizations based on Machine learning techniques
> Abstract: Realizations allow to model control systems accurately in a state space
form. Moreover, we want the order of the system to be minimal. Models
computed analytically are in general sensitive and cannot be computed in large
scale systems. The modern approach is to use input/output data to interpolate data
driven realizations. The state of the art in data driven methods are machine
learning methods. However, its application is not easy as the models which we are
dealing with have some constraints that have to be dealt with in an appropriate
manner using appropriate methods. In this talk, we will focus on a special type of
systems called Port Hamiltonian systems. These systems are energy based systems and 
have interesting properties which made them subject of interest in recent years.
The objective of this talk to introduce the attendees to problems arising in
realization theory for control systems in general and Port Hamiltonian systems in
particular. Any ideas, suggestions or contribution to the solutions of these
problems using machine learning is welcome.





# Giulia Denevi (IIT)
## Title: Incremental Learning-to-Learn with Statistical Guarantees
> Abstract: In learning-to-learn (LTL) the goal is to infer a learning algorithm that
works well on tasks sampled from an unknown meta distribution. We consider a
scenario where tasks are presented sequentially and the underlying algorithm is
Ridge Regression parametrized by a positive semidefinite matrix, implicitly
defining a linear representation shared among the tasks. We propose to learn this
matrix by minimizing the future empirical risk of the algorithm. We show that the
objective function is convex and we apply a stochastic approach to minimize it.
We give a non-asymptotic learning rate for the meta algorithm which is
comparable to previous bounds for batch LTL.


https://www.iit.it/people/giulia-denevi

Massimiliano Pontil
https://scholar.google.com/citations?hl=en&user=lcOacs8AAAAJ&view_op=list_works&sortby=pubdate



# Lynn Houthuys, Zahra Karevan and Johan Suykens (KU Leuven)
## Title: Multi-view learning for black-box weather forecasting
> Abstract: In multi-view regression, we have a regression problem where the input
data can be represented in multiple ways. These different representations are
called views. The aim of multi-view regression is to increase the performance of
using only one view by taking into account the information available from all
views. In this paper, we introduce a novel multi-view regression model called
Multi-View Least Squares Support Vector Machines (MV LS-SVM) regression.
This model is formulated in the primal-dual setting typical to Least Squares
Support Vector Machines (LS-SVM) where a coupling term is introduced in the
primal objective. This form of coupling allows for some degree of freedom to
model the different representations while being able to incorporate the
information from all views in the training phase. This work was motivated by the
challenge of predicting temperature in weather forecasting. Black-box weather
forecasting deals with a large number of observations and features and is one of
the most challenging learning task around. In order to predict the temperature in a
city, the historical data from that city as well as from the neighboring cities are
taking into account. In the past, the data for different cities were usually simply
concatenated. In this work, we use MV LS-SVM to do temperature prediction by
regarding each city as a different view. Experimental results on the minimum and
maximum temperature prediction in Brussels, show the improvement of the
multi-view method with regard to previous work and that this technique is
competitive to the existing state-of-the-art methods in weather prediction.

[1] https://ieeexplore.ieee.org/document/7965975/


Lynn Houthuys
https://scholar.google.be/citations?user=6WY0f7IAAAAJ&hl=en

Johan Suykens
https://scholar.google.be/citations?user=WtBmh0UAAAAJ&hl=en




# Sanket Kamthe and Marc Deisenroth (ICL)
## Title: Data-Efficient Reinforcement Learning with Probabilistic Model Predictive Control
> Abstract: Trial-and-error based reinforcement learning (RL) has seen rapid
advancements in recent times, especially with the advent of deep neural networks.
However, the majority of autonomous RL algorithms require a large number of
interactions with the environment. A large number of interactions may be
impractical in many real-world applications, such as robotics, and many practical
systems have to obey limitations in the form of state space or control constraints.
To reduce the number of system interactions while simultaneously handling
constraints, we propose a model-based RL framework based on probabilistic
Model Predictive Control (MPC). In particular, we propose to learn a probabilistic
transition model using Gaussian Processes (GPs) to incorporate model uncertainty
into long-term predictions, thereby, reducing the impact of model errors. We then
use MPC to find a control sequence that minimises the expected long-term cost.
We provide theoretical guarantees for first-order optimality in the GP-based
transition models with deterministic approximate inference for long-term
planning. We demonstrate that our approach does not only achieve state-of-the-art
data efficiency, but also is a principled way for RL in constrained environments.

http://proceedings.mlr.press/v84/kamthe18a.html

Sanket Kamthe
https://scholar.google.com/citations?user=IdE3rEYAAAAJ&hl=en

Marc Deisenroth
https://scholar.google.co.uk/citations?user=GDabimYAAAAJ
https://sites.google.com/view/marcdeisenroth/home
https://twitter.com/mpd37



# Maximilian Karl and Maximilian Soelch (Volkswagen)
## Title: Deep Variational Bayes Filters: Unsupervised Learning of State Space Models from Raw Data
Abstract:


https://arxiv.org/abs/1605.06432


Maximilian Karl
https://scholar.google.com/citations?user=noekAeoAAAAJ&hl=en



Maximilian Soelch
https://scholar.google.com/citations?user=MtTyY5IAAAAJ&hl=en
https://github.com/msoelch

https://argmax.ai/about/





# Martin Lellep, Jonathan Prexl, Bruno Eckhardt (Philipps University Marburg, Germany)
## Title: Predicting escape from a chaotic saddle using Machine Learning
> Abstract: Chaotic saddles appear in chemical reactions, vortex interactions, tran-
sitional shear flows and many other systems. If the saddles are hyperbolic, the
ensemble averaged lifetimes are exponentially distributed. Predicting whether a
trajectory decays or remains on the saddle for some time to come is a challenging
task on account of the typically intricate intermin- gling between escaping and
remaining trajectories. We here use a neural network to predict whether a
trajectory will escape from the chaotic sad- dle. The training input is a trajectory
segment that includes not only the current position but also some interval into the
past. The network is trained with N such samples, half of which remain on thesaddle 
and half of which escape. We study the Henon map as 2 dimensional
chaotic saddle and investigate how N and the number of steps predicted in the
future affect the prediction performance. The analysis can be extended to the
Lorenz system and a low dimensional model of fluid turbulence as a step towards
full direct numerical simulations of transitional flows.




http://lellep.xyz/

Bruno Eckhardt
https://scholar.google.com/citations?user=nwjfd4kAAAAJ&hl=en




# Lazaros Mitskopoulos, J. Hizanidis and G. Tsironis (Crete)
## Title: Learning chaotic dynamical systems with recurrent neural networks
> Abstract: Data-driven modeling of chaotic nonlinear dynamical systems has
recently entered a revolutionary phase where tools and techniques from machine
learning have offered novel approaches to hard problems. In particular, learning
algorithms based on recurrent neural networks such as Reservoir-Computing
neural networks (RC) (Jaeger and Haas, 2004) and Long Short-Term Memory
units (LSTM) (Hochreiter and Schmidhuber, 1997) have attracted considerable
interest. The former have been demonstrated to perform remarkably well in the
task of inferring the state of unmeasured state variables, after having been driven
by one or a small set of the system variables during the training period (Lu et al,
2017). Furthermore, RC were shown to possess the capacity for accurate
short-term prediction of future system states and phase space reconstruction, such
that the lyapunov exponents that are calculated from the RC-generated output
closely approximate the ones from the actual system of equations (Pathak et al,
2017; Pathak et al, 2018). Comparable success has been achieved using LSTM
networks in high-dimensional dynamical systems, for short-term prediction
(Vlachas et al, 2018) and for long-term prediction with observer nodes in the
system (Neofotistos et al, 2018).
In this study we aim to extend this line of work by investigating the performance
of the RC as well as that of the LSTM networks in inference and future state
prediction for the Hindmarsh-Rose neuron model (Hindmarsh and Rose, 1984).
We perform a more conservative training procedure deploying roll-forward cross
validation. Training is carried out with time series which are produced by
integrating the Hindmarsh-Rose equations in various parameter regimes. Then,
we conduct a detailed analysis of the state inference error in the hyperparameter
spaces of the RC and the LSTMs. Lastly, we test the performance on short-term
prediction and compare the Lyapunov exponents from the Hindmarsh-Rose
system to the ones from the predicted output generated by the RC and the LSTMs.


References
-Hindmarsh, J. L., & Rose, R. M. (1984). A model of neuronal bursting using
three coupled first order differential equations. Proc. R. Soc. Lond. B, 221(1222),
87-102.
-Hochreiter, S., & Schmidhuber, J. (1997). Long short-term memory. Neural
computation, 9(8), 1735-1780.-Jaeger, H., & Haas, H. (2004). Harnessing nonlinearity: Predicting chaotic
systems and saving energy in wireless communication. science, 304(5667), 78-80.
-Lu, Z., Pathak, J., Hunt, B., Girvan, M., Brockett, R., & Ott, E. (2017). Reservoir
observers: Model-free inference of unmeasured variables in chaotic systems.
Chaos: An Interdisciplinary Journal of Nonlinear Science, 27(4),041102.
-Neofotistos, G., Mattheakis, M., Barmparis, G. D., Hizanidis, J., Tsironis, G. P.,
& Kaxiras, E. (2018). Machin learning with observers predicts complex
spatiotemporal behavior. arXiv preprint arXiv:1807.10758.
-Pathak, J., Hunt, B., Girvan, M., Lu, Z., & Ott, E. (2018). Model-free prediction
of large spatiotemporally chaotic systems from data: a reservoir computing
approach. Physical review letters, 120(2), 024102.
-Pathak, J., Lu, Z., Hunt, B. R., Girvan, M., & Ott, E. (2017). Using machine
learning to replicate chaotic attractors and calculate Lyapunov exponents from
data. Chaos: An Interdisciplinary Journal of Nonlinear Science, 27(12), 121102.
-Vlachas, P. R., Byeon, W., Wan, Z. Y., Sapsis, T. P., & Koumoutsakos, P.
(2018). Data-driven forecasting of high-dimensional chaotic systems with long
short-term memory networks. Proc. R. Soc. A, 474(2213), 20170844.


Johanne Hizanidis
https://scholar.google.com/citations?user=OxojJRMAAAAJ&hl=en

http://limnos.chem.demokritos.gr/ioannahiz.html


Giorgos Tsironis
http://www.physics.uoc.gr/en/faculty/g.tsironis
https://scholar.google.co.uk/citations?user=L7vdsyMAAAAJ&hl=en



# Jaideep Pathak (UMD)
## Title: Using Machine Learning for Data-Driven Analysis of Ergodic Properties of Dynamical Systems
> Abstract: We demonstrate the effectiveness of machine learning for data-driven
analysis of chaotic systems. Using a computationally efficient recurrent neural
network called an echo state network or reservoir computer [1] we show that we
can reconstruct the attractor of high dimensional chaotic dynamical systems with
un- precedented fidelity. This reconstruction allows us to determine the ergodic
properties (e.g., the spectrum of Lyapunov exponents) of a dynamical system
purely from data [2]. We obtain excellent results using machine learning for these
difficult tasks where traditional methods have had limited success.

[1] Herbert Jaeger and Harald Haas. Harnessing nonlinearity: Predicting chaotic
systems and saving energy in wireless communication. Science,
304(5667):78–80, 2004.

[2] Jaideep Pathak, Zhixin Lu, Brian R Hunt, Michelle Girvan, and Edward Ott.
Using machine learning to replicate chaotic attractors and calculate lyapunov
exponents from data. Chaos: An Interdisciplinary Journal of Nonlinear Science,
27(12):121102, 2017.


Jaideep Pathak
https://scholar.google.com/citations?user=cevw0gkAAAAJ&hl=en
http://physics.umd.edu/~jpathak/



# Samuel Rudy (UW)
## Title: Deep Learning of Dynamics and Signal-Noise Decomposition
> Abstract: A critical challenge in the data-driven modeling of dynamical systems is
producing methods robust to measurement error, particularly when data is limited.
Many leading methods either rely on denoising prior to learning or on access to
large volumes of data to average over the effect of noise. We propose a novel
paradigm for data-driven modeling that simultaneously learns the dynamics and
estimates the measurement noise at each observation. Our method explicitly
accounts for measurement error in the map between observations, treating both
the measurement error and the dynamics as unknowns to be identified, rather than
assuming idealized noiseless trajectories. We model the unknown vector field
using a neural network, imposing a Runge-Kutta integrator structure to isolate this
vector field, even when the data has a non-uniform time-step, thus constraining
and focusing the modeling effort. We demonstrate the ability of this framework to
form predictive models on a variety of canonical test problems of increasing
complexity and show that it is robust to substantial amounts of measurement
error.
[1] https://arxiv.org/pdf/1808.02578.pdf

https://github.com/snagcliffs/RKNN


Samuel H. Rudy
https://scholar.google.com/citations?user=QrK_paAAAAAJ&hl=en
http://shrudy.com/


Steven L. Brunton
https://scholar.google.com/citations?user=TjzWdigAAAAJ&hl=en
https://twitter.com/eigensteve



# Anastasios Tsourtis (Crete)
## Title: Inference of Dynamical Systems from Population Data using the Fokker-Planck equation
> Abstract: Inferring the driving equations of a dynamical system from population
or time-course data is important in several scientific fields such as biochemistry,
epidemiology, financial mathematics and many others. Despite the existence of
algorithms that infer the dynamics from trajectorial measurements there are no
attempts to infer the dynamical system from population data. In this work, we
employ and then computationally infer the Fokker-Planck equation which
describes the evolution of the population's probability density. Then, following
the USDL approach [1], we project the
Fokker-Planck equation to a proper set of data-driven functions, transforming it
into a linear system of equations. Finally, we apply sparse inference methods to
induce the driving forces of the dynamical system. Our approach is illustrated in
both synthetic and real data including non-linear, multimodal stochastic
differential equations, biochemical reaction networks as well as mass cytometry
biological measurements.

[1] https://arxiv.org/abs/1710.00718


Anastasios Tsourtis
http://macomms.tem.uoc.gr/members/alumni/22-tsourtis-anastasios



# Miguel Xochicale (Birmingham)
## Title: Quantification of Dynamic Facial Expressions with Shannon Entropy in Human-Humanoid Interaction
> Abstract: Research on understanding and quantifying movement variability with
nonlinear analyses has been well established in the last three decades in areas
such as biome- chanics, sport science, psychology, cognitive science, and
neuroscience (Davids et al., 2003). This work is hypothesising that nonlinear
analyses can be used to quantify subtle variations of facial expressions that can be
related to different mental states (i.e. anxiety, disinterest, relief, etc) (Back and
Jordan, 2014). This hypothesis has then led the author to ask two research
questions:
(i) how the quantification of facial expressions can be related to the complexity of
facial expressions?, and
(ii) does the quantification of the complexity for facial expressions can tell us
some- thing about the state of mind of a person?,
In order to give insights into the raised questions, this work is proposing the use
of Recurrence Quantification Analysis (RQA) to quantify the complexity of facial
expressions which is based on previous investigations of the author with nonlinear
dynamics to quantify movement variability in human-humanoid interaction
(Xochi- cale, 2018). RQA computes measurements based on the density of
recurrence points of diagonal line structures in the Recurrence Plots. For which,
RQA provide under- standing of the dynamics of a system i.e. the determinism
(predictability of a system) or Shannon entropy (complexity of a system)
(Marwan et al., 2007). With that in mind, a pilot experiment is designed to show
the complexity of facial expressions vari- ability. In the experiment one
participant (the author) were asked to perform three levels of variability of face
expressions: (i) neutral variations, (ii) slow variations, and (iii) faster variations.
Then, using time-series data of 67 face landmarks collected with OpenFace
(Baltrusaitis et al., 2018), 3D plots of RQA Entr (Shannon entropy) were
computed in order to quantify the complexity of face expressions and therefore
relate 3D plots of RQA Entr to both (i) the subtle variations of facial expressions
and (ii) the state of mind of a person. Additionally, this work will present
potential ap- plications in the context of human-humanoid interaction for
automatic quantification of face expressions that can be related to person’s state
of mind.

References
Back, E. and Jordan, T. R. (2014). Revealing variations in perception of mental
states from dynamic facial expressions: A cautionary note. PLOS ONE, 9(1):1–5.
Baltrusaitis, T., Zadeh, A., Lim, Y. C., and Morency, L. (2018). Openface 2.0:
Facial behavior analysis toolkit. In 2018 13th IEEE International Conference on
Automatic Face and Gesture Recognition (FG 2018)(FG), volume 00, pages
59–66.
Davids, K., Glazier, P., Araujo, D., and Bartlett, R. (2003). Movement systems as
dynamical systems. Sports Medicine, 33(4):245–260.
Marwan, N., Romano, M. C., Thiel, M., and Kurths, J. (2007). Recurrence plots
for the analysis of complex systems. Physics Reports, 438(5):237 – 329.Xochicale, M. (2018). Nonlinear Analyses to Quantify Movement Variability in
Human-Humanoid Interaction. PhD dissertation as submitted, University of Birm-
ingham, United Kingdom.



