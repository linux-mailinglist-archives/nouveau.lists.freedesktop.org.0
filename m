Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC0955411
	for <lists+nouveau@lfdr.de>; Tue, 25 Jun 2019 18:10:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FAEA6E15F;
	Tue, 25 Jun 2019 16:10:54 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id CBB036E15F
 for <nouveau@lists.freedesktop.org>; Tue, 25 Jun 2019 16:10:53 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id C8A8B72167; Tue, 25 Jun 2019 16:10:53 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Tue, 25 Jun 2019 16:10:53 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: m.meledandri@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 qa_contact attachments.created
Message-ID: <bug-110997-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 110997] New: NV50 fan runs at full speed after
 resume from suspend on kernels 5.1.8, 4.19.49
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
Content-Type: multipart/mixed; boundary="===============1968203415=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============1968203415==
Content-Type: multipart/alternative; boundary="15614790531.841eE92.14905"
Content-Transfer-Encoding: 7bit


--15614790531.841eE92.14905
Date: Tue, 25 Jun 2019 16:10:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110997

            Bug ID: 110997
           Summary: NV50 fan runs at full speed after resume from suspend
                    on kernels 5.1.8, 4.19.49
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau@lists.freedesktop.org
          Reporter: m.meledandri@gmail.com
        QA Contact: xorg-team@lists.x.org

Created attachment 144635
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144635&action=3Dedit
vbios.rom

As of stable kernels 5.1.8 and 4.19.49, the GTX 260 fan runs at full speed
after resuming from suspend.

This behavior regressed as of commit 342406e4fbba9a174125fbfe6aeac3d64ef90f=
76
drm/nouveau/i2c: Disable i2c bus access after ->fini()
https://lkml.org/lkml/2019/6/7/673

Reverting this single commit when building the respective stable kernels fi=
xes
the fan speed issue.

$ lspci -nn -d 10de:
01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GT200 [GeForce=
 GTX
260] [10de:05e2] (rev a1)

Discussion on Nouveau mailing list:
https://lists.freedesktop.org/archives/nouveau/2019-June/032620.html

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15614790531.841eE92.14905
Date: Tue, 25 Jun 2019 16:10:53 +0000
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
   title=3D"NEW - NV50 fan runs at full speed after resume from suspend on =
kernels 5.1.8, 4.19.49"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110997">110997</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>NV50 fan runs at full speed after resume from suspend on kern=
els 5.1.8, 4.19.49
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
          <td>m.meledandri&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144635=
" name=3D"attach_144635" title=3D"vbios.rom">attachment 144635</a> <a href=
=3D"attachment.cgi?id=3D144635&amp;action=3Dedit" title=3D"vbios.rom">[deta=
ils]</a></span>
vbios.rom

As of stable kernels 5.1.8 and 4.19.49, the GTX 260 fan runs at full speed
after resuming from suspend.

This behavior regressed as of commit 342406e4fbba9a174125fbfe6aeac3d64ef90f=
76
drm/nouveau/i2c: Disable i2c bus access after -&gt;fini()
<a href=3D"https://lkml.org/lkml/2019/6/7/673">https://lkml.org/lkml/2019/6=
/7/673</a>

Reverting this single commit when building the respective stable kernels fi=
xes
the fan speed issue.

$ lspci -nn -d 10de:
01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GT200 [GeForce=
 GTX
260] [10de:05e2] (rev a1)

Discussion on Nouveau mailing list:
<a href=3D"https://lists.freedesktop.org/archives/nouveau/2019-June/032620.=
html">https://lists.freedesktop.org/archives/nouveau/2019-June/032620.html<=
/a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15614790531.841eE92.14905--

--===============1968203415==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1968203415==--
