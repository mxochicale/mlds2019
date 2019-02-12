Tuesday Feb 12 (Pippard lecture theatre, Sheffield Building, level 5)
---


# (09:00) Rossella Arcucci and Yi-Ke Guo (Imperial College London, r.arcucci@imperial.ac.uk)
## Deep Data Assimilation: Integrating Deep Learning with Data Assimilation. 
> Abstract: Data assimilation is a methodology to incorporate observed data into a
prediction model in order to improve numerical forecasting. Conventional
methods for data assimilation include Kalman filters and variational approaches.
In the past 20 years these methods has become a main component in the
development and validation of mathematical models in meteorology, climatology,
geophysics, geology and hydrology. Recently, data assimilation is also applied to
numerical simulations of geophysical applications, medicine and biological
science. Data assimilation methods have strongly increased in sophistication to
better fit their application requirements and circumvent their implementationissues. 
Nevertheless, DA approaches are incapable of overcoming fully their
unrealistic assumptions, particularly linearity, normality and zero error
covariances. With the rapid developments in recent years, deep learning shows
great capability in approximating nonlinear systems, and extracting
high-dimensional features. Machine learning algorithms are capable of assisting
or replacing the traditional methods in making forecasts, without the assumptions
of the conventional methods. On the other side, the training data provided to deep
learning technologies, include several numerical, approximation and round off
errors which are trained in the deep learning forecasting model. This means that,
in some safety and security-sensitive scenarios, deep learning are still not
qualified to avoid unpredictable risks. Data assimilation can increase the
reliability of the deep learning models reducing those errors by including
information on physical meanings from observed data. The resulting cohesion of
deep learning and data assimilation is then blended in the future generation of
predictive models.



Rossella Arcucci
https://www.imperial.ac.uk/people/r.arcucci
https://scholar.google.com/citations?user=oxy2ZQoAAAAJ&hl=en




# (09:30) Grzegorz Swirszcz (DeepMind, grzegorz.swirszcz@gmail.com)
## Title: Local minima in training of neural networks
> Abstract: There has been a lot of recent interest in trying to characterize the error
surface of deep models. This stems from a long standing question. Given that
deep networks are highly nonlinear systems optimized by local gradient methods,
why do they not seem to be affected by bad local minima? It is widely believed
that training of deep models using gradient methods works so well because the
error surface either has no local minima, or if they exist they need to be close 
invalue to the global minimum. It is known that such results hold under very strong
assumptions which are not satisfied by real models. In this paper we present
examples showing that for such theorem to be true additional assumptions on the
data, initialization schemes and/or the model classes have to be made. We look at
the particular case of finite size datasets. We demonstrate that in this scenario one
can construct counter-examples (datasets or initialization schemes) when the
network does become susceptible to bad local minima over the weight space.



Grzegorz Świrszcz
https://sites.google.com/site/grzegorzswirszcz/  
https://scholar.google.co.uk/citations?user=YeefX_oAAAAJ&hl=en  



# (10:00) Marco Gallieri (NNAISENSE, marco@nnaisense.com)
## Title: NAIS-NET: Stable Deep Networks from Non-Autonomous Differential Equations
> Abstract: This talk introduces Non-Autonomous InputOutput Stable Network
(NAIS-Net), a very deep architecture where each stacked processing block is
derived from a time-invariant non-autonomous dynamical system. Non-autonomy
is implemented by skip connections from the block input to each of the unrolled
processing stages and allows stability to be enforced so that blocks can be
unrolled adaptively to a pattern-dependent processing depth. NAIS-Net induces
non-trivial, Lipschitz input-output maps, even for an infinite unroll length. We
prove that the network is globally asymptotically stable so that for every initial
condition there is exactly one input-dependent equilibrium assuming tanh units,
and multiple stable equilibria for ReL units. An efficient implementation that
enforces the stability under derived conditions for both fully-connected and
convolutional layers is also presented. Experimental results show how 
NAIS-Netexhibits stability in practice, yielding a significant reduction in 
generalization gap compared to ResNets.


Marco Gallieri
https://scholar.google.co.uk/citations?user=moNjsXoAAAAJ&hl=en
http://marcogallieri.micso.it/Home.html








# (11:00) Vincent Fortuin (ETH, fortuin@inf.ethz.ch)
## Title: Deep Self-Organization: Interpretable Discrete Representation Learning on Time Series
> Abstract: Human professionals are often required to make decisions based on
complex multivariate time series measurements in an online setting, e.g. in health
care. Since human cognition is not optimized to work well in high-dimensional
spaces, these decisions benefit from interpretable low-dimensional
representations. However, many representation learning algorithms for time series
data are difficult to interpret. This is due to non-intuitive mappings from data
features to salient properties of the representation and non-smoothness over time.
To address this problem, we propose to couple a variational autoencoder to a
discrete latent space and introduce a topological structure through the use of
self-organizing maps. This allows us to learn discrete representations of time
series, which give rise to smooth and interpretable embeddings with superior
clustering performance. Furthermore, to allow for a probabilistic interpretation of
our method, we integrate a Markov model in the latent space. This model
uncovers the temporal transition structure, improves clustering performance even
further and provides additional explanatory insights as well as a natural
representation of uncertainty. We evaluate our model on static (Fashion-)MNIST
data, a time series of linearly interpolated (Fashion-)MNIST images, a chaotic
Lorenz attractor system with two macro states, as well as on a challenging real
world medical time series application. In the latter experiment, our representation
uncovers meaningful structure in the acute physiological state of a patient.

References: 
[1]  https://arxiv.org/abs/1806.02199


Vincent Fortuin
https://scholar.google.ch/citations?user=XBlrYTIAAAAJ&hl=en
https://bmi.inf.ethz.ch/people/person/vincent-fortuin/
https://twitter.com/vincefort


# (1130) Peter Ashwin (Exeter, P.Ashwin@exeter.ac.uk)
## Title: Network attractors and the functional dynamics of recurrent neural networks
> Abstract: Attractors for dynamical systems come in a variety of types and
structures, and understanding this can help to predict the behaviour of the system
to inputs. Network attractors, which consist of heteroclinic or excitable networks
of states in phase space give a useful paradigm to explain how a dynamical
system may perform broadly accurate finite state computation, for example, as a
Turing machine. Recurrent neural networks (RNNs), such as Echo State
Networks, are themselves complex dynamical systems that are trained to respond
dynamically to inputs in a task-dependent way. In this talk I will discuss some
attempts to understand the computational abilities of RNNs using their
nonautonomous dynamical behaviour and suggest ways to efficiently design
RNNs suited to specific tasks. This is joint work with Andrea Ceni, Lorenzo Livi
and Claire Postlethwaite.



Peter Ashwin
https://scholar.google.co.uk/citations?user=naUN7kQAAAAJ&hl=en
http://emps.exeter.ac.uk/mathematics/staff/pashwin



# (12:00) Tiago Pereira DaSilva (Universidade de São Paulo, tiagophysics@gmail.com)
## Title: Effective networks: a model to predict network structure and critical transitions from datasets
> Abstract: Real-world complex systems, such as ecological communities, neuron
networks, and power grids, are essential components of our everyday lives. These
complex systems are composed of units, or nodes, which interact through intricate
networks. By observing the dynamical behaviour of complex systems, statistical
and machine-learning techniques can predict their future behaviour without
knowing how the nodes interact. The ability to predict sudden changes in network
behaviour, also known as critical transitions, is important to be able to avert
potentially disastrous consequences of major disruptions in the complex systems.
However, predicting such new behaviours is a major challenge. In this talk, we
address this by building a model network, termed an effective network, consisting
of the underlying local dynamics at each node and an accurate statistical
description of their interactions. To illustrate the power of effective networks to
predict critical transitions, we reconstruct the dynamics and structure of real
networks using neuronal interactions in the cat cerebral cortex, and demonstrate
the effective network's ability to predict critical transitions for parameters outside
the observed range. This novel methodology raises the possibility that networks
can be controlled to anticipate malfunctions.



http://fge.if.usp.br/~tiagops/
http://gradmat.ufabc.edu.br/corpo-docente/199-tiago-pereira-da-silva



# (12:30) AmirAli Ahmadi (Princeton, a_a_a@princeton.edu)
## Title: Nonnegative polynomials, learning, and control
> Abstract: The problem of recognizing nonnegativity of a multivariate polynomial
has a celebrated history, tracing back to Hilbert’s 17th problem. In recent years,
there has been much renewed interest in the topic because of a multitude of
applications in applied and computational mathematics and the observation that
one can optimize over an interesting subset of nonnegative polynomials using
“sum of squares optimization”.
In this talk, we give a brief overview of the recent developments in this field and
show how they can be applied to problems in learning, dynamics and control, as
well as the intersection of the two. Examples include the problem of learning a
Lyapunov function subject to shape constraints (e.g., convexity or monotonicity),
and that of learning a dynamical system subject to qualitative knowledge of the
behavior of trajectories (e.g., stability, invariance, or collision avoidance).


Amir Ali Ahmadi
http://aaa.princeton.edu/
https://scholar.google.com/citations?user=CmoKVuUAAAAJ&hl=en



# (1400) Heather Harrington (University of Oxford, harrington@maths.ox.ac.uk)
## Title: Topological data analysis for investigation of dynamics and networks
> Abstract: Persistent homology (PH) is a technique in topological data analysis that
allows one to examine features in data across multiple scales in a robust and
mathematically principled manner, and it is being applied to an increasingly
diverse set of applications. We investigate applications of PH to dynamics and
networks, focusing on two settings: dynamics on a network and dynamics  of a
network.
Dynamics on a network: a contagion spreading on a network is influenced by the
spatial embeddedness of the network. In modern day, contagions can spread as a
wave and through the appearance of new clusters via long-range edges, such as
international flights. We study contagions by constructing ‘contagion maps’ that
use multiple contagions on a network to map the nodes as a point cloud. By
analyzing the topology, geometry, and dimensionality of manifold structure in
such point clouds, we reveal insights to aid in the modelling, forecast, and control
of spreading processes.
Dynamics of a network: one can construct static graph snapshots to represent a
network that changes in time (e.g. edges are added/removed). We show that
partitionings of a network of random-graph ensembles into snapshots using
existing methods often lack meaningful temporal structure that corresponds to
features of the underlying system. We apply persistent homology to track the
topology of a network over time and distinguish important temporal features from
trivial ones. We define two types of topological spaces derived from temporal
networks and use persistent homology to generate a temporal profile for a
network. We show that the methods we apply from computational topology can
distinguish temporal distributions and provide a high-level summary of temporal
structure.
Together, these two investigations illustrate that persistent homology can be very
illuminating in the study of networks and their applications.


Heather Harrington 
https://www.maths.ox.ac.uk/people/heather.harrington
https://scholar.google.co.uk/citations?user=seVn7WwAAAAJ&hl=en
https://twitter.com/haharrington?lang=en



# (1430) Hamza Ghadyali (SAS Institute, Cary, NC, Hamza@hmgxyz.com)
## Title: Brains, Waves, and Oribts: Topological Data Analysis with Machine Learning for Data-Driven Discovery of Dynamical Systems
> Abstract: For time-varying dynamical systems, the geometric properties of an
orbit can indicate the state of the system. Multi-dimensional time-series data
from real-world applications can be modelled as representing such a dynamical
system through Takens-style delay-embeddings, however these embeddings are at
best approximations to the underlying latent dynamical systems and can be very
high dimensional. Analyzing non-linear or non-local features of high dimensional
data is challenging due to the curse of dimensionality, which is where Topological
Data Analysis (TDA) plays a useful role. TDA is a set of techniques for robustly
extracting geometric information from data, even when the data is
high-dimensional. For some problems, where a rule cannot be easily formulated
for associating geometric configurations of the system to invariant sets of the
dynamics, machine learning can be used to find that mapping from observed data.
Deep learning, as a special case, has also proven useful in that regard and can find
that mapping through hierarchical data-driven feature representations. We
evaluate these ideas in the context of EEG-based epileptic-seizure detection and
prediction, asking the question of whether we can use TDA and machine learning
to discover characteristic geometric signatures of the anomalous electrical-activity
in the underlying dynamical system which is the network of the brain’s neurons
together with its environment. We also evaluate it in the context of climate
dynamics looking at weather data and obtaining new metrics for analyzing
variation in periodic phenomenon.

Hamza Ghadyali
http://hmgxyz.com/


# (1500) Massimiliano Pontil (UCL and IIT, massimiliano.pontil@gmail.com)
## Title: Incremental Learning-to-Learn with Statistical Guarantees (joint work with Giulia Denevi, Carlo Ciliberto and Dimitris Stamos)
> Abstract: In learning-to-learn the goal is to infer a learning algorithm that works
well on a class of tasks sampled from an unknown meta distribution. In contrast to
previous work on batch learning-to-learn, we consider a scenario where tasks are
presented sequentially and the algorithm needs to adapt incrementally to improve
its performance on future tasks. Key to this setting is for the algorithm to rapidly
incorporate new observations into the model as they arrive, without keeping them
in memory. We focus on the case where the underlying algorithm is ridge
regression parameterized by a positive semidefinite matrix. We propose to learn
this matrix by applying a stochastic strategy to minimize the empirical error
incurred by ridge regression on future tasks sampled from the meta distribution.
We study the statistical properties of the proposed algorithm and prove
non-asymptotic bounds on its excess transfer risk, that is, the generalization
performance on new tasks from the same meta distribution. We compare our
online learning-to-learn approach with a state of the art batch method, both
theoretically and empirically.

https://arxiv.org/abs/1803.08089


Massimiliano Pontil
http://www0.cs.ucl.ac.uk/staff/m.pontil/
https://scholar.google.com/citations?user=lcOacs8AAAAJ&hl=en


# (1530) Saverio Salzo (IIT, salzo.uni@gmail.com)
## Title: Bilevel Learning of the Group Lasso Structure
> Abstract: Regression with group-sparsity penalty plays a central role in
high-dimensional prediction problems. However, most of existing methods
require the group structure to be known a priori. In practice, this may 
be a toostrong assumption, potentially hampering the effectiveness of the regularization
method. To circumvent this issue, we present a method to estimate the group
structure by means of a continuous bilevel optimization problem where the data is
split into training and validation sets. Our approach relies on an approximation
scheme where the lower level problem is replaced by a suitable discrete dynamics
which is smooth with respect to the hyperparameters of the group structure. We
show the convergence of the approximate procedure to theexact problem and
demonstrate the well behavior of the proposed method on synthetic and real
experiments.



Saverio Salzo
https://www.iit.it/people/saverio-salzo
https://scholar.google.it/citations?user=zocrDQkAAAAJ&hl=en





# (1630) Kevin Lin (U. Arizona, klin@math.arizona.edu)
## Title: Data-driven modeling of chaotic dynamics: a model reduction perspective
> Abstract: Nonlinear dynamic phenomena often require a large number of
dynamical variables for their description, only a small fraction of which are of
direct interest. Reduced models using only these relevant variables can be very
useful in such situations, both for computational efficiency and insights into the
underlying dynamics. Unfortunately, except in special cases, deriving reduced
models from first principles can be quite challenging. This has motivated interest
in both parametric and nonparametric data-driven modeling in the model
reduction community. In this talk, I will review a discrete-time version of the
Mori-Zwanzig (MZ) projection operator formalism from nonequilibrium
statistical mechanics, which provides a simple and general framework for model
reduction. I will then discuss data-driven modeling and model reduction for
chaotic dynamical systems within the MZ framework, highlighting some of the
theoretical and practical issues that arise.


Kevin K Lin
https://www.math.arizona.edu/~klin/index.php
https://scholar.google.co.uk/citations?user=73c_sxkAAAAJ&hl=en
https://github.com/kkylin/



# (1700) Daan Crommelin (CWI Amsterdam, Daan.Crommelin@cwi.nl)
## Title: Data-driven stochastic modeling for multiscale dynamical systems
> Abstract: Modeling and simulation of multiscale dynamical systems (e.g.
atmosphere and ocean) is challenging due to the wide range of spatio-temporal
scales that need to be taken into account. To tackle this issue, one can employ
stochastic models to represent the feedback from dynamical processes at the
small/fast scales onto processes at larger scales. I will discuss ongoing work on
extracting such stochastic subgrid-scale (i.e., small-scale) models from data,
including results with resampling methods and discrete models. 
A key aspect isthe two-way coupling of the data-driven subgrid-scale model to a given (e.g.
physics-based) large-scale model. Furthermore, the involved systems often
display spatial and temporal correlations (or even memory) that should be
accounted for.
[1] https://ir.cwi.nl/pub/23851
[2] http://journals.ametsoc.org/doi/abs/10.1175/2008JAS2566.1



https://homepages.cwi.nl/~dtc/
https://scholar.google.nl/citations?user=Ef0CTDkAAAAJ&hl=en




# (1730) Peter Dueben (ECMWF, Peter.Dueben@ecmwf.int)
## Title: Challenges and design choices for global weather and climate models based on machine learning
> Abstract: Can models that are based on deep learning and trained on atmospheric
data compete with weather and climate models that are based on physical
principles and the basic equations of motion? This question has been asked often
recently due to the boom of deep learning techniques. The question is valid given
the huge amount of data that is available, the computational efficiency of deep
learning techniques and the limitations of today's weather and climate models in
particular with respect to resolution and complexity. In this talk, the question will
be discussed in the context of global weather forecasts. A toy-model for global
weather predictions will be presented and used to identify challenges and
fundamental design choices for a forecast system based on Neural Networks.

References: 
[1] https://www.geosci-model-dev-discuss.net/gmd-2018-148/


Peter Dueben
https://www.ecmwf.int/en/about/who-we-are/staff-profiles/peter-dueben
https://scholar.google.co.uk/citations?user=WtpW-KgAAAAJ&hl=en










