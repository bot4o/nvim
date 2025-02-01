<h1>Bobbi's nvim configurations</h1>
<b>Prerequisite:</b> 
<ul>
    <li>
        Clone via the coresponding command for you operating system:<a href="https://github.com/wbthomason/packer.nvim">packer.nvim</a>;
    </li>
    <li>
        Install ripgrep on you system;
    </li>
</ul>
<h2>How to run?</h2>
<h3><i>Linux</i></h3>
<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxAMQwl_ns_bCO1ZBJCozsqb8Qf7cpu5hshA&s" style="width: 100px; height: auto;"alt="penguin">
<ol>
    <li>Install this <a href="https://github.com/bot4o/nvim">nvim</a> repo to you config location</li>
    ```bash
    git clone ~/.config
    ```
    <li>After you open the nvim cloned repo open the lua/bobbi/packer.lua file with <b>nvim</b>.</li>
    <br>
    <p>And run the following using command mode </p>
    ```viml
    :so
    -- then
    :PackerSync
    ```
</ol>


