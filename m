Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F7576B9B
	for <lists+nouveau@lfdr.de>; Fri, 26 Jul 2019 16:28:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 266376ED8C;
	Fri, 26 Jul 2019 14:28:37 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 76E8F6ED8C
 for <nouveau@lists.freedesktop.org>; Fri, 26 Jul 2019 14:28:35 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 6F46E72167; Fri, 26 Jul 2019 14:28:35 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Fri, 26 Jul 2019 14:28:35 +0000
X-Bugzilla-Reason: QAcontact AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/DRI/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: rcoe@wi.rr.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111217-8800-RQZxiGOsWF@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111217-8800@http.bugs.freedesktop.org/>
References: <bug-111217-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 111217] compilation of vdpau shaders crashes in
 handleCVT_CVT
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1123869578=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============1123869578==
Content-Type: multipart/alternative; boundary="15641513150.487aAEEB.27793"
Content-Transfer-Encoding: 7bit


--15641513150.487aAEEB.27793
Date: Fri, 26 Jul 2019 14:28:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111217

--- Comment #2 from rcoe@wi.rr.com ---
Is this a dup or a different issue?

Thread 25 "vlc" received signal SIGSEGV, Segmentation fault.
[Switching to Thread 0x7fffbc1a8700 (LWP 24784)]
0x00007fffaa6ccd4f in nv50_ir::AlgebraicOpt::handleCVT_CVT (this=3D<optimiz=
ed
out>, cvt=3D<optimized out>) at /usr/include/c++/9/bits/stl_deque.h:270
270           _M_set_node(_Map_pointer __new_node) _GLIBCXX_NOEXCEPT
(gdb) where
#0  0x00007fffaa6ccd4f in nv50_ir::AlgebraicOpt::handleCVT_CVT (this=3D<opt=
imized
out>, cvt=3D<optimized out>) at /usr/include/c++/9/bits/stl_deque.h:270
#1  nv50_ir::AlgebraicOpt::visit (this=3D0x7fffbc1a5370, bb=3D<optimized ou=
t>) at
../src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp:2351
#2  0x00007fffaa703b37 in nv50_ir::Pass::doRun (this=3D0x7fffbc1a5370,
func=3D<optimized out>, ordered=3D<optimized out>, skipPhi=3Dfalse) at
../src/gallium/drivers/nouveau/codegen/nv50_ir_bb.cpp:495
#3  0x00007fffaa539145 in nv50_ir::Pass::doRun (skipPhi=3Dfalse, ordered=3D=
false,
prog=3D0x0, this=3D0x7fffbc1a5370) at
../src/gallium/drivers/nouveau/codegen/nv50_ir_bb.cpp:466
#4  nv50_ir::Pass::run(nv50_ir::Program*, bool, bool) [clone .constprop.0]
(this=3Dthis@entry=3D0x7fffbc1a5370, prog=3Dprog@entry=3D0x7fffa00b09c0,
skipPhi=3DskipPhi@entry=3Dfalse, ordered=3Dfalse) at
../src/gallium/drivers/nouveau/codegen/nv50_ir_bb.cpp:457
#5  0x00007fffaa6c341d in nv50_ir::Program::optimizeSSA (this=3D0x7fffa00b0=
9c0,
level=3D3) at ../src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp:4=
005
#6  0x00007fffaa7181f9 in nv50_ir_generate_code (info=3D0x7fffa0134220) at
../src/gallium/drivers/nouveau/codegen/nv50_ir.cpp:1267
#7  0x00007fffaa6a7369 in nvc0_program_translate (prog=3D0x7fffa0112ff0,
chipset=3D<optimized out>, debug=3D0x7fffa00cebf8) at
../src/gallium/drivers/nouveau/nvc0/nvc0_program.c:638
#8  0x00007fffaa7647d2 in nvc0_cp_state_create (pipe=3D0x7fffa00ce830,
cso=3D0x7fffbc1a6150) at ../src/gallium/drivers/nouveau/nvc0/nvc0_context.h=
:292
#9  0x00007fffaa92bf12 in vl_compositor_cs_create_shader (c=3D0x7fffa00a809=
8,
compute_shader_text=3D<optimized out>) at
../src/gallium/auxiliary/vl/vl_compositor_cs.c:433
#10 0x00007fffaa941467 in init_shaders (c=3D0x7fffa00a8098) at
../src/gallium/auxiliary/vl/vl_compositor.c:74
#11 vl_compositor_init (pipe=3D<optimized out>, c=3D<optimized out>) at
../src/gallium/auxiliary/vl/vl_compositor.c:770
#12 __vaDriverInit_1_4 (ctx=3D0x7fffa0060240) at
../src/gallium/state_trackers/va/context.c:163

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15641513150.487aAEEB.27793
Date: Fri, 26 Jul 2019 14:28:35 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - compilation of vdpau shaders crashes in handleCVT_CVT"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111217#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - compilation of vdpau shaders crashes in handleCVT_CVT"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111217">bug 11121=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
rcoe&#64;wi.rr.com" title=3D"rcoe&#64;wi.rr.com">rcoe&#64;wi.rr.com</a>
</span></b>
        <pre>Is this a dup or a different issue?

Thread 25 &quot;vlc&quot; received signal SIGSEGV, Segmentation fault.
[Switching to Thread 0x7fffbc1a8700 (LWP 24784)]
0x00007fffaa6ccd4f in nv50_ir::AlgebraicOpt::handleCVT_CVT (this=3D&lt;opti=
mized
out&gt;, cvt=3D&lt;optimized out&gt;) at /usr/include/c++/9/bits/stl_deque.=
h:270
270           _M_set_node(_Map_pointer __new_node) _GLIBCXX_NOEXCEPT
(gdb) where
#0  0x00007fffaa6ccd4f in nv50_ir::AlgebraicOpt::handleCVT_CVT (this=3D&lt;=
optimized
out&gt;, cvt=3D&lt;optimized out&gt;) at /usr/include/c++/9/bits/stl_deque.=
h:270
#1  nv50_ir::AlgebraicOpt::visit (this=3D0x7fffbc1a5370, bb=3D&lt;optimized=
 out&gt;) at
../src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp:2351
#2  0x00007fffaa703b37 in nv50_ir::Pass::doRun (this=3D0x7fffbc1a5370,
func=3D&lt;optimized out&gt;, ordered=3D&lt;optimized out&gt;, skipPhi=3Dfa=
lse) at
../src/gallium/drivers/nouveau/codegen/nv50_ir_bb.cpp:495
#3  0x00007fffaa539145 in nv50_ir::Pass::doRun (skipPhi=3Dfalse, ordered=3D=
false,
prog=3D0x0, this=3D0x7fffbc1a5370) at
../src/gallium/drivers/nouveau/codegen/nv50_ir_bb.cpp:466
#4  nv50_ir::Pass::run(nv50_ir::Program*, bool, bool) [clone .constprop.0]
(this=3Dthis&#64;entry=3D0x7fffbc1a5370, prog=3Dprog&#64;entry=3D0x7fffa00b=
09c0,
skipPhi=3DskipPhi&#64;entry=3Dfalse, ordered=3Dfalse) at
../src/gallium/drivers/nouveau/codegen/nv50_ir_bb.cpp:457
#5  0x00007fffaa6c341d in nv50_ir::Program::optimizeSSA (this=3D0x7fffa00b0=
9c0,
level=3D3) at ../src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp:4=
005
#6  0x00007fffaa7181f9 in nv50_ir_generate_code (info=3D0x7fffa0134220) at
../src/gallium/drivers/nouveau/codegen/nv50_ir.cpp:1267
#7  0x00007fffaa6a7369 in nvc0_program_translate (prog=3D0x7fffa0112ff0,
chipset=3D&lt;optimized out&gt;, debug=3D0x7fffa00cebf8) at
../src/gallium/drivers/nouveau/nvc0/nvc0_program.c:638
#8  0x00007fffaa7647d2 in nvc0_cp_state_create (pipe=3D0x7fffa00ce830,
cso=3D0x7fffbc1a6150) at ../src/gallium/drivers/nouveau/nvc0/nvc0_context.h=
:292
#9  0x00007fffaa92bf12 in vl_compositor_cs_create_shader (c=3D0x7fffa00a809=
8,
compute_shader_text=3D&lt;optimized out&gt;) at
../src/gallium/auxiliary/vl/vl_compositor_cs.c:433
#10 0x00007fffaa941467 in init_shaders (c=3D0x7fffa00a8098) at
../src/gallium/auxiliary/vl/vl_compositor.c:74
#11 vl_compositor_init (pipe=3D&lt;optimized out&gt;, c=3D&lt;optimized out=
&gt;) at
../src/gallium/auxiliary/vl/vl_compositor.c:770
#12 __vaDriverInit_1_4 (ctx=3D0x7fffa0060240) at
../src/gallium/state_trackers/va/context.c:163</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15641513150.487aAEEB.27793--

--===============1123869578==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1123869578==--
