#import "Class.typ": *


#show: ieee.with(
  title: [#text(smallcaps("Lab 1 : Web Application with Genie"))],
  /*
  abstract: [
    #lorem(12).
  ],
  */
  authors:
  (
    (
      name: "Oussama Tabai",
      department: [AII 22],
      organization: [ISET Bizerte --- Tunisia],
      profile: "Oussamatabai",
    ),
    (
      name: "Bayrem selmi",
      department: [AII 22],
      organization: [ISET Bizerte --- Tunisia],
      profile: "Bayremselmi",
    ),
  )
)

= *Exercise*
In this lab, you will create a basic web application using *Genie framework* in Julia. The application will allow us to control the behaviour of a sine wave, given some adjustble parameters. You are required to carry out this lab using the REPL as in @fig:julia.

#figure(
	image("Images/Julia.png", width: 80%, fit: "contain"),
	caption: "Julia"
	) <fig:julia>

#exo[*Sine Wave Control*][We provide the Julia and HTML codes to build and run a web app that allows us to control the amplitude and frequency of a sine wave. 



*samples* : We also added a slider to change the number of samples used to draw the figure. .The range is from 
100 to 1000 / with steps : 1 

*amplitude* : We added a slider to change the amplitude max and min of sine wave .The range is from 
0 to 8 / with steps : 0.5

*frequency* : The latter setting permits to grasp the influence of sampling frequency on the look of our chart .The range is from 
0 to 100 / with steps : 1

*phase* : this slider adjusts the phaseof the sine wave. the range is from 
-3.14 to 3.14 / with steps : 0.314

*offset* : this slider adjusts the offset of sine wave.The range is from -0.5 to 1 / with steps : 1


]

#exo[*phase*][*Phase ranging between −3.14 and 3.14, changes by a step of 0.314*]


```julia
@in pha::Float32 = 1
---
@onchange N, amp, freq , pha  begin
        x = range(0, 1, length=N)
        y = amp*sin.(2*π*freq*x .+pha)
```
*Julia*


```HTML
<div class="st-col col-12 col-sm st-module">
        <p><b>phase</b></p>
	<q-slider v-model="pha" 
		:min="-3.14" :max="3.14" 
		:step="0.314" :label="true"> 
	</q-slider>
    </div>
```
*html*

#figure(
	image("Images/Capture11.PNG", width: 100%, fit: "contain"),
	caption: "add phase"
	) <fig:phase>


#exo[*offset*][*Offset varies from −0.5 to 1, by a step of 0.1*]

```julia
@in ofs::Float32 = 1
---
@onchange N, amp, freq , pha , ofs begin
        x = range(0, 1, length=N)
        y = amp*sin.(2*π*freq*x .+pha).+ofs
*Julia*
```

```HTML
<div class="st-col col-12 col-sm st-module">
        <p><b>offset</b></p>
	<q-slider v-model="ofs" 
		:min="-0.5" :max="1" 
		:step="0.1" :label="true"> 
	</q-slider>
    </div>
```
*html*
#figure(
	image("Images/Capture22.PNG", width: 100%, fit: "contain"),
	caption: "add offset"
	) <fig:offset>
```zsh
all the prorgam
```

#let code=read("../Codes/web-app/app.jl")
#raw(code, lang: "julia")


#let code=read("../Codes/web-app/app.jl.html")
#raw(code, lang: "html")

```zsh
julia -- project
```

```julia
cd("(location of the folder)/infodev-main/Codes/web-app")
julia> using GenieFramework
julia> Genie.loadapp() # Load app
julia> up() # Start the server
```

We can now open the browser and navigate to the link #highlight[#link("http://127.0.0.1/:8000")[http://127.0.0.1/:8000]]. We will get the graphical interface as in @fig:genie-webapp.

#figure(
	image("Images/Capture22.PNG", width: 100%),
	caption: "Genie -> Sine Wave",
) <fig:genie-webapp>