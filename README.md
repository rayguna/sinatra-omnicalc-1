# sinatra-omnicalc-1

[Notes for this project are here.](https://learn.firstdraft.com/lessons/100)

Activities:

1. Run the code in codespace. In the terminal, type ruby app.rb. Open a browser from the PORTS tab. Here is what I see:
<pre>
<h1>Welcome to your Sinatra App!</h1>
Define some routes in app.rb
</pre>

2. 
<ul>
  <li>
  Create a file within the views folder called hello.erb. In the file, simply type Hi!
  </li>

  <li>
  Note that the command require "sinatra/reloader" within app.rb allows changes to the app.rb file to be reflected immediately on the web-page without the need to restart the server. 
  </li>

  <li>
  To the app.rb, add a route called /howdy. Within the block, add a line to call the erb function to load hello.erb. Automatically, the function will load layout.erb, which serves as a universal template, as follows:
  </li>
</ul>

```
require "sinatra"
require "sinatra/reloader"

get("/howdy") do
  erb(:hello)
end

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end
```

3. Add form tag within hello.erb as follows:

```
<form action = "https://en.wikipedia.org/wiki/Chicago">
<h1> Form experiments </h1>
  <label for="first_name"> first name </label>
  <input id="first_name" type = "text" name="first">
  
  <label for="last_name"> last name </label>
  <input id ="last_name" type = "text" name="last">
  <button>Go to Wikipedia</button>
</form>

```

- In the above, labels are assigned to each inputs having for attributes that match the inputs id. Clicking on the labels will automatically place the cursor within the textbox with the corresponding id.
- Clicking on the Go to Wikipedia button leads to url: https://en.wikipedia.org/wiki/Chicago?first=Johan&last=Moen.
- Note that at the end of the wikipedia url, the following commands are passed from the textbox as a hash data structure: ```?first=Johan&last=Moen```, but it is not recognized by the url. 

4. Modify the code within hello.erb, so that clicking the button will process the textbox input, rather than transferring the browser to a wikipedia page, as follows:

```
<form action = "goodbye">
<h1> Form experiments </h1>
  <label for="first_name"> first name </label>
  <input id="first_name" type = "text" name="first">
  
  <label for="last_name"> last name </label>
  <input id ="last_name" type = "text" name="last">
  <button> Go to /goodbye </button>
</form>
```

At the same time, we need to add a /goodbye route in the app.rb page, as follows.

```
require "sinatra"
require "sinatra/reloader"

get("/howdy") do
  #"Hello there" #test
  erb(:hello)
end

get("/goodbye") do
  erb(:bye)
end

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end
```

Also, enter the contents of the bye.rb file as follows:
```
<h1> Goodbye </h1>
```
- Clicking on the button append the hash data structure to the route, ``` https://fuzzy-engine-9q7rwrgj6rrfxqj7-4567.app.github.dev/goodbye?first=J&last=D ```. These parameters are, however, ignored.
- You can parse and view the hash data structure by adding the command <%=params%> within bye.erb. On the /goodbye page, you will see:

<pre>
 <h1> Goodbye </h1>
{"first"=>"Johny", "last"=>"Moen"} 
</pre>

5. Display user's inputs on the /goodbye page by modifying bye.erb as follows:

```
<h1> Goodbye </h1>

<%=params%>

<div> First name: <%=params.fetch("first")%> </div>
<div> Last name: <%=params.fetch("last")%> </div>
```
