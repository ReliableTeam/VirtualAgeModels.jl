using VirtualAgeModels

m = @vam(Temps & Type ~ (ARA1(.4) | Weibull(0.01,2.5)))
df = rand(m, @stop (size < 30))

b = bayesian( @vam(Temps & Type ~ (ARAInf(~Uniform())| Weibull(~Uniform(1,1.5),~Uniform(2,4))), data=df))

mb = VirtualAgeModels.mcmc(b,params(m))
mb[mb.ind .== 3,:θ]
mb[mb.ind .== 2,:θ]
mb.ind