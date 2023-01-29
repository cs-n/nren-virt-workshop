---
marp: true
title: Desktop Virtualization using Oracle VirtualBox
description: Desktop Virtualization using Oracle VirtualBox
footer: '_Virtualization Workshop_'
paginate: false
theme: gaia
# other themes: uncover, default
# class: lead
# Default size 16:9
size: 4:3
backgroundColor: #fff
#backgroundImage: url('https://marp.app/assets/hero-background.jpg')
backgroundImage: url('../images/hero-background.jpg')
style: |
    h1, footer {
        color: #4e8fc7;
    }
    h2 {
        color: #455a64;
        color: #f97c28;
    }
    footer {
        #text-align: right;
        height: 50px;
        line-height: 30px;
    }
    ol, ul {
        padding-top: 0;
        #margin-top: 0;
        font-size: 90%;
    }
    ol > li, ul > li {
        margin: 0;
    }
    ol > li> p, ul > li > p {
        margin: 0;
    }
    a {
        text-decoration: none;
    }
---

<style scoped>
h1 {
  color: #4e8fc7;
}
h2 {
    color: #455a64;
    color: #f97c28;
}
img {
    float: left;
    margin-left: -40px;
}
pre {
    margin: -25px 50px 0px;
    width: 810px;
    float: right;
}
pre > code {
    background-color: #f8f8f8;
    color: #4d4d4c;
}
</style>
<!--
_class: lead
_footer: '' 
_paginate: false
-->

# Desktop Virtualization

## VirtualBox

<br />
<br />
<br />
<br />

![bg bottom 30%](../images/Virtualbox_logo.png)

<br />
<br />

### NREN

Feb 10 - 12, 2023

[![Creative Commons License](https://i.creativecommons.org/l/by-nc/4.0/88x31.png)](http://creativecommons.org/licenses/by-nc/4.0/)

```licence
This material is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License (http://creativecommons.org/licenses/by-nc/4.0/)
```

---

## What do we mean?

- Running VMs on your laptop or desktop machine with keyboard and screen
- Especially useful for:
  - Trying out other operating systems
  - Development and test environments (sandboxes)
  - Running foreign applications

---

## Things we like

- Simple to use GUI
- Features
  - Represent the guest's console as a window
  - Easy use of keyboard and mouse
  - Copy-paste between the guest and the host–Disk image management and snapshots
- We are not worried about datacentre-grade scalability

---
<style scoped>
img {
    float: right;
    width: 30%;
    margin: auto -20px;
}

</style>

## Oracle VirtualBox

![VirtualBox Logo](../images/Virtualbox_logo.png)

- a powerful x86 and AMD64/Intel64 virtualization product for enterprise as well as home use
- an extremely feature rich, high performance product for enterprise customers
- it is also the only professional solution that is freely available as Open Source Software
- cross-platform virtualization application

---
<style scoped>
blockquote {
    border-top: 0.1em dashed #555;
    font-size: 60%;
    margin-top: 100px;
}
blockquote:before {
    content:"*";
}
blockquote:after {
    content:"";
}
</style>
## Why VirtualBox?

- Pros:
  - Free\* and Open Source (GPL)\*
  - Available for Windows, Mac, Linux, FreeBSD
  - Good documentation
  - Easy to use and powerful
  - Can run 64-bit guests on 32-bit host (with VT-x)
- Cons:
  - It's owned by Oracle

> Except the optional Extension Pack, which is closed source, free for personal use only

---

## Things you need to know

- Default disk image format is "VDI" and you can choose either fixed or growable
- The default networking mode is "NAT" and you don't need to configure anything
  - Client will pick up IP address (10.0.2.15) via DHCP and can make outbound connections
- The full manual is included (Help > Contents) or you can download it separately

---

## Things you need to know (2)

- Click in the guest window to capture the keyboard and mouse
- **To release the keyboard and mouse, press the "_host key_" which is usually _Right Ctrl_**
- You can get better keyboard/mouse integration by installing the "VBox Guest Additions"
  - Then you can simply move your mouse over the window and move it away again
  - Also lets you copy-paste and share files with the guest

---

## Practical exercise

- Install VirtualBox on your laptop
  - if you have more than 1GB RAM and more than 5GB free hard drive space
- Create a VM and install Ubuntu within it
- If you have time: install the VirtualBox Guest Additions and more VMs

---

<!-- _class: lead -->
## :question: <!--fit-->
