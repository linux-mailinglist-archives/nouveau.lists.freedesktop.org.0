Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7D067FBA
	for <lists+nouveau@lfdr.de>; Sun, 14 Jul 2019 17:20:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B48F189831;
	Sun, 14 Jul 2019 15:20:49 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5081A89831
 for <nouveau@lists.freedesktop.org>; Sun, 14 Jul 2019 15:20:48 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 46CA172167; Sun, 14 Jul 2019 15:20:48 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Sun, 14 Jul 2019 15:20:48 +0000
X-Bugzilla-Reason: QAcontact AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/DRI/nouveau
X-Bugzilla-Version: 19.1
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: gzgagz@zoho.eu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 qa_contact
Message-ID: <bug-111128-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 111128] New: Impossible to change pstate on GT610M
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
Content-Type: multipart/mixed; boundary="===============2033180527=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============2033180527==
Content-Type: multipart/alternative; boundary="15631176480.79d761bcD.21960"
Content-Transfer-Encoding: 7bit


--15631176480.79d761bcD.21960
Date: Sun, 14 Jul 2019 15:20:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111128

            Bug ID: 111128
           Summary: Impossible to change pstate on GT610M
           Product: Mesa
           Version: 19.1
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau@lists.freedesktop.org
          Reporter: gzgagz@zoho.eu
        QA Contact: nouveau@lists.freedesktop.org

Hello,
I have an asus UX32VD, with a GT610M inside, which works with the Optimus
architecture, handle by PRIME. The bug is currently with the kernel 5.2.0, =
but
it have always been like that as far as I remember.

uname -a :
Linux ga-laptop 5.2.0-arch2-1-ARCH #1 SMP PREEMPT Mon Jul 8 18:18:54 UTC 20=
19
x86_64 GNU/Linux

lspci :
01:00.0 3D controller: NVIDIA Corporation GF117M [GeForce 610M/710M/810M/82=
0M /
GT 620M/625M/630M/720M] (rev a1)

While it is not in use, nouveau shutdown the chipset as expected :
cat /sys/kernel/debug/dri/1/pstate
07: core 270 MHz memory 405 MHz
0f: core 625 MHz memory 900 MHz
DC: core 0 MHz memory 0 MHz

While an app is launched with DRI_PRIME=3D1, we can see that the chipset is=
 set
to 07 :
DRI_PRIME=3D1 glxgears &
cat /sys/kernel/debug/dri/1/pstate
07: core 270 MHz memory 405 MHz
0f: core 625 MHz memory 900 MHz
DC: core 270 MHz memory 324 MHz

But when I tried to reclock, I have an error :
echo 0f > /sys/kernel/debug/dri/1/pstate
-bash: echo: write error: Function not implemented

And I have this in dmesg:
[  351.283183] nouveau 0000:01:00.0: bus: MMIO write of ffff8c1f FAULT at
6013d4 [ IBUS ]
[  458.362570] nouveau 0000:01:00.0: bus: MMIO write of 0000001f FAULT at
6013d4 [ IBUS ]

Thanks

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15631176480.79d761bcD.21960
Date: Sun, 14 Jul 2019 15:20:48 +0000
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
   title=3D"NEW - Impossible to change pstate on GT610M"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111128">111128</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Impossible to change pstate on GT610M
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>19.1
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
          <td>normal
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
          <td>gzgagz&#64;zoho.eu
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Hello,
I have an asus UX32VD, with a GT610M inside, which works with the Optimus
architecture, handle by PRIME. The bug is currently with the kernel 5.2.0, =
but
it have always been like that as far as I remember.

uname -a :
Linux ga-laptop 5.2.0-arch2-1-ARCH #1 SMP PREEMPT Mon Jul 8 18:18:54 UTC 20=
19
x86_64 GNU/Linux

lspci :
01:00.0 3D controller: NVIDIA Corporation GF117M [GeForce 610M/710M/810M/82=
0M /
GT 620M/625M/630M/720M] (rev a1)

While it is not in use, nouveau shutdown the chipset as expected :
cat /sys/kernel/debug/dri/1/pstate
07: core 270 MHz memory 405 MHz
0f: core 625 MHz memory 900 MHz
DC: core 0 MHz memory 0 MHz

While an app is launched with DRI_PRIME=3D1, we can see that the chipset is=
 set
to 07 :
DRI_PRIME=3D1 glxgears &amp;
cat /sys/kernel/debug/dri/1/pstate
07: core 270 MHz memory 405 MHz
0f: core 625 MHz memory 900 MHz
DC: core 270 MHz memory 324 MHz

But when I tried to reclock, I have an error :
echo 0f &gt; /sys/kernel/debug/dri/1/pstate
-bash: echo: write error: Function not implemented

And I have this in dmesg:
[  351.283183] nouveau 0000:01:00.0: bus: MMIO write of ffff8c1f FAULT at
6013d4 [ IBUS ]
[  458.362570] nouveau 0000:01:00.0: bus: MMIO write of 0000001f FAULT at
6013d4 [ IBUS ]

Thanks</pre>
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

--15631176480.79d761bcD.21960--

--===============2033180527==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============2033180527==--
