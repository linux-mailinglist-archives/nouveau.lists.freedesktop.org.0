Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A59F5E3D61
	for <lists+nouveau@lfdr.de>; Thu, 24 Oct 2019 22:34:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E79C6E7A3;
	Thu, 24 Oct 2019 20:34:19 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 869DF6E79D
 for <nouveau@lists.freedesktop.org>; Thu, 24 Oct 2019 20:34:18 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 7F18B720E2; Thu, 24 Oct 2019 20:34:18 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Thu, 24 Oct 2019 20:34:18 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: sandy97@buziaczek.pl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 qa_contact attachments.created
Message-ID: <bug-112123-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 112123] New: Laptop freezes after suspend [write
 fault]
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
Content-Type: multipart/mixed; boundary="===============0762643960=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0762643960==
Content-Type: multipart/alternative; boundary="15719492580.BF0C30.28029"
Content-Transfer-Encoding: 7bit


--15719492580.BF0C30.28029
Date: Thu, 24 Oct 2019 20:34:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D112123

            Bug ID: 112123
           Summary: Laptop freezes after suspend [write fault]
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: critical
          Priority: not set
         Component: Driver/nouveau
          Assignee: nouveau@lists.freedesktop.org
          Reporter: sandy97@buziaczek.pl
        QA Contact: xorg-team@lists.x.org

Created attachment 145812
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145812&action=3Dedit
A part of journalctl, describing process of crash

Description:
When I suspend (close) my laptop and then try to wake it up, it freezes;
everything is displayed, however, inputs stop reacting and everything on sc=
reen
stops moving too. It happens only with GUIs - when I suspend it while in
terminal, it works fine (when I go back to GUI it switches and then freezes,
sadly).
According to journal, this is because of Nouveau having trouble with memory
read:

pa=C5=BA 24 13:43:31 Langley kernel: [drm] Initialized nouveau 1.3.1 201208=
01 for
0000:01:00.0 on minor 0
pa=C5=BA 24 21:42:32 Langley kernel: nouveau 0000:01:00.0: fifo: write faul=
t at
0000048000 engine 07 [PFIFO] client 07 [BAR_READ] reason 02 [PAGE_NOT_PRESE=
NT]
on channel 2 [003fc13000 Xorg[538]]
pa=C5=BA 24 21:42:32 Langley kernel: nouveau 0000:01:00.0: fifo: fifo engin=
e fault
on channel 2, recovering...
(don't mind Polish month)

Usually, keyboard works just for a few seconds (Caps/Num Lock LEDs react),
touchpad doesn't. I don't think the whole system crashes, I believe it's st=
ill
working but is blocked by unresponsive driver.

I believe that if I wait 10 minutes or so, it actually may start working ag=
ain;
however, reboot is faster in this case.

If I just let my laptop be, so it suspends while open, it wakes up perfectl=
y.

Specs:
Distribution: Arch
Kernel: 5.3.7-arch1-1-ARCH (tested mainline 5.4.0-rc4, bug still occurs; al=
so
occurs on other, older kernels; didn't test other distros)
Laptop: Sony Vaio, model VPCEH2D1E C1065BHW=20
GPU: GeForce 410M

Steps to reproduce:
1. Close the laptop so it goes to sleep
2. Open it and press something
Since I couldn't find anyone else with this same error, I suppose you need
similar/same model, graphic card or configuration (Sony Vaio with 410M etc).

I am attaching a part of journalctl (starts at lid closing).

Also, I was instructed to report the bug here at the Arch bug list, where I
first described the bug.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15719492580.BF0C30.28029
Date: Thu, 24 Oct 2019 20:34:18 +0000
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
   title=3D"NEW - Laptop freezes after suspend [write fault]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112123">112123</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Laptop freezes after suspend [write fault]
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
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
          <td>critical
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>not set
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>sandy97&#64;buziaczek.pl
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145812=
" name=3D"attach_145812" title=3D"A part of journalctl, describing process =
of crash">attachment 145812</a> <a href=3D"attachment.cgi?id=3D145812&amp;a=
ction=3Dedit" title=3D"A part of journalctl, describing process of crash">[=
details]</a></span>
A part of journalctl, describing process of crash

Description:
When I suspend (close) my laptop and then try to wake it up, it freezes;
everything is displayed, however, inputs stop reacting and everything on sc=
reen
stops moving too. It happens only with GUIs - when I suspend it while in
terminal, it works fine (when I go back to GUI it switches and then freezes,
sadly).
According to journal, this is because of Nouveau having trouble with memory
read:

pa=C5=BA 24 13:43:31 Langley kernel: [drm] Initialized nouveau 1.3.1 201208=
01 for
0000:01:00.0 on minor 0
pa=C5=BA 24 21:42:32 Langley kernel: nouveau 0000:01:00.0: fifo: write faul=
t at
0000048000 engine 07 [PFIFO] client 07 [BAR_READ] reason 02 [PAGE_NOT_PRESE=
NT]
on channel 2 [003fc13000 Xorg[538]]
pa=C5=BA 24 21:42:32 Langley kernel: nouveau 0000:01:00.0: fifo: fifo engin=
e fault
on channel 2, recovering...
(don't mind Polish month)

Usually, keyboard works just for a few seconds (Caps/Num Lock LEDs react),
touchpad doesn't. I don't think the whole system crashes, I believe it's st=
ill
working but is blocked by unresponsive driver.

I believe that if I wait 10 minutes or so, it actually may start working ag=
ain;
however, reboot is faster in this case.

If I just let my laptop be, so it suspends while open, it wakes up perfectl=
y.

Specs:
Distribution: Arch
Kernel: 5.3.7-arch1-1-ARCH (tested mainline 5.4.0-rc4, bug still occurs; al=
so
occurs on other, older kernels; didn't test other distros)
Laptop: Sony Vaio, model VPCEH2D1E C1065BHW=20
GPU: GeForce 410M

Steps to reproduce:
1. Close the laptop so it goes to sleep
2. Open it and press something
Since I couldn't find anyone else with this same error, I suppose you need
similar/same model, graphic card or configuration (Sony Vaio with 410M etc).

I am attaching a part of journalctl (starts at lid closing).

Also, I was instructed to report the bug here at the Arch bug list, where I
first described the bug.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15719492580.BF0C30.28029--

--===============0762643960==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0762643960==--
