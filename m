Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9479675716
	for <lists+nouveau@lfdr.de>; Thu, 25 Jul 2019 20:38:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C5B76E80B;
	Thu, 25 Jul 2019 18:38:48 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 932CD6E80B
 for <nouveau@lists.freedesktop.org>; Thu, 25 Jul 2019 18:38:46 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 8ADAE72167; Thu, 25 Jul 2019 18:38:46 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Thu, 25 Jul 2019 18:38:46 +0000
X-Bugzilla-Reason: QAcontact AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/DRI/nouveau
X-Bugzilla-Version: 19.0
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: mmgrqnv@jadamspam.pl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 qa_contact attachments.created
Message-ID: <bug-111218-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 111218] New: Segmentation fault in
 nv50_ir::NVC0LegalizeSSA::handleDIV when dividing result of textureSize
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
Content-Type: multipart/mixed; boundary="===============1483356174=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============1483356174==
Content-Type: multipart/alternative; boundary="15640799260.Aaed.6301"
Content-Transfer-Encoding: 7bit


--15640799260.Aaed.6301
Date: Thu, 25 Jul 2019 18:38:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111218

            Bug ID: 111218
           Summary: Segmentation fault in
                    nv50_ir::NVC0LegalizeSSA::handleDIV when dividing
                    result of textureSize
           Product: Mesa
           Version: 19.0
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau@lists.freedesktop.org
          Reporter: mmgrqnv@jadamspam.pl
        QA Contact: nouveau@lists.freedesktop.org

Created attachment 144869
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144869&action=3Dedit
Source of small program and somewhat minimized shaders

Hi!

I was looking into a crash[1] in latest version of Blender, which turned ou=
t to
be a crash in the Nouveau shader code generator.
The crash occurs when linking shaders. I traced the crash to the following
lines in the shader code:

  ivec2 cell_co =3D ivec2(3, 2);
  int cell_per_row =3D textureSize(irradianceGrid, 0).x / cell_co.x;
  cell_co.x *=3D cell % cell_per_row;
  cell_co.y *=3D cell / cell_per_row;

The crash seems to occur when the result of dividing textureSize() value is
later used in division or modulo operations. Replacing the textureSize() ca=
ll
with a constant avoids the crash. Replacing the division and modulo operati=
ons
with simple assignment (but keeping the first division / cell_co.x) also av=
oids
the crash.
This is the relevant stack trace:

(gdb) bt
#0  nv50_ir::NVC0LegalizeSSA::handleDIV (this=3Dthis@entry=3D0x7fffffffba50,
i=3Di@entry=3D0x555555e592c0) at
../src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nvc0.cpp:54
#1  0x00007ffff2e6b38b in nv50_ir::NVC0LegalizeSSA::visit (this=3D0x7ffffff=
fba50,
bb=3D<optimized out>) at
../src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nvc0.cpp:334
#2  0x00007ffff2dc40d8 in nv50_ir::Pass::doRun (this=3Dthis@entry=3D0x7ffff=
fffba50,
func=3D<optimized out>, ordered=3Dordered@entry=3Dfalse, skipPhi=3DskipPhi@=
entry=3Dtrue)
    at ../src/gallium/drivers/nouveau/codegen/nv50_ir_bb.cpp:495
#3  0x00007ffff2dc41b4 in nv50_ir::Pass::doRun (this=3Dthis@entry=3D0x7ffff=
fffba50,
prog=3Dprog@entry=3D0x555555e6e9f0, ordered=3Dordered@entry=3Dfalse,
skipPhi=3DskipPhi@entry=3Dtrue)
    at ../src/gallium/drivers/nouveau/codegen/nv50_ir_bb.cpp:466
#4  0x00007ffff2dc4273 in nv50_ir::Pass::run (this=3Dthis@entry=3D0x7ffffff=
fba50,
prog=3Dprog@entry=3D0x555555e6e9f0, ordered=3Dordered@entry=3Dfalse,
skipPhi=3DskipPhi@entry=3Dtrue)
    at ../src/gallium/drivers/nouveau/codegen/nv50_ir_bb.cpp:457
#5  0x00007ffff2e66dd4 in nv50_ir::TargetNVC0::runLegalizePass (this=3D<opt=
imized
out>, prog=3D0x555555e6e9f0, stage=3D<optimized out>) at
../src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nvc0.cpp:3145
#6  0x00007ffff2dc150f in nv50_ir_generate_code
(info=3Dinfo@entry=3D0x555555dcd9f0) at
../src/gallium/drivers/nouveau/codegen/nv50_ir.cpp:1265
#7  0x00007ffff2e0988a in nvc0_program_translate
(prog=3Dprog@entry=3D0x555555d79fc0, chipset=3D<optimized out>,
debug=3Ddebug@entry=3D0x5555557a74c8) at
../src/gallium/drivers/nouveau/nvc0/nvc0_program.c:624
#8  0x00007ffff2e1121d in nvc0_sp_state_create (pipe=3D0x5555557a7100,
cso=3D0x7fffffffc490, type=3D1) at
../src/gallium/drivers/nouveau/nvc0/nvc0_state.c:605
#9  0x00007ffff3042963 in st_create_fp_variant (st=3D<optimized out>,
stfp=3Dstfp@entry=3D0x555555d74db0, key=3Dkey@entry=3D0x7fffffffc630) at
../src/mesa/state_tracker/st_program.c:1231
#10 0x00007ffff3045253 in st_get_fp_variant (st=3D<optimized out>,
stfp=3D0x555555d74db0, key=3D0x7fffffffc630) at
../src/mesa/state_tracker/st_program.c:1258
#11 0x00007ffff3045a7c in st_precompile_shader_variant
(st=3Dst@entry=3D0x5555557a4c10, prog=3Dprog@entry=3D0x555555d74db0) at
../src/mesa/state_tracker/st_program.c:1965
#12 0x00007ffff30ece0b in st_program_string_notify (ctx=3D<optimized out>,
target=3D<optimized out>, prog=3D0x555555d74db0) at
../src/mesa/state_tracker/st_cb_program.c:250
#13 0x00007ffff3112f85 in st_link_shader (ctx=3D0x55555578aed0,
prog=3D0x5555557b6fd0) at ../src/mesa/state_tracker/st_glsl_to_tgsi.cpp:7461
#14 0x00007ffff30b5729 in _mesa_glsl_link_shader (ctx=3Dctx@entry=3D0x55555=
578aed0,
prog=3Dprog@entry=3D0x5555557b6fd0) at ../src/mesa/program/ir_to_mesa.cpp:3=
174
#15 0x00007ffff3000f8d in link_program (no_error=3D<optimized out>,
shProg=3D<optimized out>, ctx=3D<optimized out>) at
../src/mesa/main/shaderapi.c:1206
#16 link_program_error (ctx=3D0x55555578aed0, shProg=3D0x5555557b6fd0) at
../src/mesa/main/shaderapi.c:1286
#17 0x00005555555553f2 in test_compile ()
#18 0x000055555555586b in main ()

I attach a small program along with preprocessed and *somewhat* minimized
shader code that reproduces the problem on my computer. This code crashes 1=
00%
of the time.

To reproduce the crash:
$ gcc -Wall -o shad shad.c -lX11 -lGL -lGLU -lGLEW
$ ./shad s0vert.i s1frag.i s2geom.i
Compilation successful!
Segmentation fault


System information:
Ubuntu 18.04.2 LTS
Linux-4.15.0-55-generic-x86_64
Graphics card: NVIDIA Corporation GF108 [GeForce GT 730] (rev a1)
Graphics card driver: NVC1 nouveau 4.3 (Core Profile) Mesa 19.0.2
Using GNOME under X
libgl1-mesa-dri: 19.0.2-1ubuntu1.1~18.04.2

The original Blender crash report along with full shader source dump can be
found here:
[1] https://developer.blender.org/T67534

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15640799260.Aaed.6301
Date: Thu, 25 Jul 2019 18:38:46 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Segmentation fault in nv50_ir::NVC0LegalizeSSA::handleDIV=
 when dividing result of textureSize"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111218">111218</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Segmentation fault in nv50_ir::NVC0LegalizeSSA::handleDIV whe=
n dividing result of textureSize
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>19.0
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>major
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Drivers/DRI/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>mmgrqnv&#64;jadamspam.pl
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144869=
" name=3D"attach_144869" title=3D"Source of small program and somewhat mini=
mized shaders">attachment 144869</a> <a href=3D"attachment.cgi?id=3D144869&=
amp;action=3Dedit" title=3D"Source of small program and somewhat minimized =
shaders">[details]</a></span>
Source of small program and somewhat minimized shaders

Hi!

I was looking into a crash[1] in latest version of Blender, which turned ou=
t to
be a crash in the Nouveau shader code generator.
The crash occurs when linking shaders. I traced the crash to the following
lines in the shader code:

  ivec2 cell_co =3D ivec2(3, 2);
  int cell_per_row =3D textureSize(irradianceGrid, 0).x / cell_co.x;
  cell_co.x *=3D cell % cell_per_row;
  cell_co.y *=3D cell / cell_per_row;

The crash seems to occur when the result of dividing textureSize() value is
later used in division or modulo operations. Replacing the textureSize() ca=
ll
with a constant avoids the crash. Replacing the division and modulo operati=
ons
with simple assignment (but keeping the first division / cell_co.x) also av=
oids
the crash.
This is the relevant stack trace:

(gdb) bt
#0  nv50_ir::NVC0LegalizeSSA::handleDIV (this=3Dthis&#64;entry=3D0x7fffffff=
ba50,
i=3Di&#64;entry=3D0x555555e592c0) at
../src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nvc0.cpp:54
#1  0x00007ffff2e6b38b in nv50_ir::NVC0LegalizeSSA::visit (this=3D0x7ffffff=
fba50,
bb=3D&lt;optimized out&gt;) at
../src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nvc0.cpp:334
#2  0x00007ffff2dc40d8 in nv50_ir::Pass::doRun (this=3Dthis&#64;entry=3D0x7=
fffffffba50,
func=3D&lt;optimized out&gt;, ordered=3Dordered&#64;entry=3Dfalse, skipPhi=
=3DskipPhi&#64;entry=3Dtrue)
    at ../src/gallium/drivers/nouveau/codegen/nv50_ir_bb.cpp:495
#3  0x00007ffff2dc41b4 in nv50_ir::Pass::doRun (this=3Dthis&#64;entry=3D0x7=
fffffffba50,
prog=3Dprog&#64;entry=3D0x555555e6e9f0, ordered=3Dordered&#64;entry=3Dfalse,
skipPhi=3DskipPhi&#64;entry=3Dtrue)
    at ../src/gallium/drivers/nouveau/codegen/nv50_ir_bb.cpp:466
#4  0x00007ffff2dc4273 in nv50_ir::Pass::run (this=3Dthis&#64;entry=3D0x7ff=
fffffba50,
prog=3Dprog&#64;entry=3D0x555555e6e9f0, ordered=3Dordered&#64;entry=3Dfalse,
skipPhi=3DskipPhi&#64;entry=3Dtrue)
    at ../src/gallium/drivers/nouveau/codegen/nv50_ir_bb.cpp:457
#5  0x00007ffff2e66dd4 in nv50_ir::TargetNVC0::runLegalizePass (this=3D&lt;=
optimized
out&gt;, prog=3D0x555555e6e9f0, stage=3D&lt;optimized out&gt;) at
../src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nvc0.cpp:3145
#6  0x00007ffff2dc150f in nv50_ir_generate_code
(info=3Dinfo&#64;entry=3D0x555555dcd9f0) at
../src/gallium/drivers/nouveau/codegen/nv50_ir.cpp:1265
#7  0x00007ffff2e0988a in nvc0_program_translate
(prog=3Dprog&#64;entry=3D0x555555d79fc0, chipset=3D&lt;optimized out&gt;,
debug=3Ddebug&#64;entry=3D0x5555557a74c8) at
../src/gallium/drivers/nouveau/nvc0/nvc0_program.c:624
#8  0x00007ffff2e1121d in nvc0_sp_state_create (pipe=3D0x5555557a7100,
cso=3D0x7fffffffc490, type=3D1) at
../src/gallium/drivers/nouveau/nvc0/nvc0_state.c:605
#9  0x00007ffff3042963 in st_create_fp_variant (st=3D&lt;optimized out&gt;,
stfp=3Dstfp&#64;entry=3D0x555555d74db0, key=3Dkey&#64;entry=3D0x7fffffffc63=
0) at
../src/mesa/state_tracker/st_program.c:1231
#10 0x00007ffff3045253 in st_get_fp_variant (st=3D&lt;optimized out&gt;,
stfp=3D0x555555d74db0, key=3D0x7fffffffc630) at
../src/mesa/state_tracker/st_program.c:1258
#11 0x00007ffff3045a7c in st_precompile_shader_variant
(st=3Dst&#64;entry=3D0x5555557a4c10, prog=3Dprog&#64;entry=3D0x555555d74db0=
) at
../src/mesa/state_tracker/st_program.c:1965
#12 0x00007ffff30ece0b in st_program_string_notify (ctx=3D&lt;optimized out=
&gt;,
target=3D&lt;optimized out&gt;, prog=3D0x555555d74db0) at
../src/mesa/state_tracker/st_cb_program.c:250
#13 0x00007ffff3112f85 in st_link_shader (ctx=3D0x55555578aed0,
prog=3D0x5555557b6fd0) at ../src/mesa/state_tracker/st_glsl_to_tgsi.cpp:7461
#14 0x00007ffff30b5729 in _mesa_glsl_link_shader (ctx=3Dctx&#64;entry=3D0x5=
5555578aed0,
prog=3Dprog&#64;entry=3D0x5555557b6fd0) at ../src/mesa/program/ir_to_mesa.c=
pp:3174
#15 0x00007ffff3000f8d in link_program (no_error=3D&lt;optimized out&gt;,
shProg=3D&lt;optimized out&gt;, ctx=3D&lt;optimized out&gt;) at
../src/mesa/main/shaderapi.c:1206
#16 link_program_error (ctx=3D0x55555578aed0, shProg=3D0x5555557b6fd0) at
../src/mesa/main/shaderapi.c:1286
#17 0x00005555555553f2 in test_compile ()
#18 0x000055555555586b in main ()

I attach a small program along with preprocessed and *somewhat* minimized
shader code that reproduces the problem on my computer. This code crashes 1=
00%
of the time.

To reproduce the crash:
$ gcc -Wall -o shad shad.c -lX11 -lGL -lGLU -lGLEW
$ ./shad s0vert.i s1frag.i s2geom.i
Compilation successful!
Segmentation fault


System information:
Ubuntu 18.04.2 LTS
Linux-4.15.0-55-generic-x86_64
Graphics card: NVIDIA Corporation GF108 [GeForce GT 730] (rev a1)
Graphics card driver: NVC1 nouveau 4.3 (Core Profile) Mesa 19.0.2
Using GNOME under X
libgl1-mesa-dri: 19.0.2-1ubuntu1.1~18.04.2

The original Blender crash report along with full shader source dump can be
found here:
[1] <a href=3D"https://developer.blender.org/T67534">https://developer.blen=
der.org/T67534</a></pre>
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

--15640799260.Aaed.6301--

--===============1483356174==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1483356174==--
