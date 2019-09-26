Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6A0BF97B
	for <lists+nouveau@lfdr.de>; Thu, 26 Sep 2019 20:44:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 570A16EDD8;
	Thu, 26 Sep 2019 18:44:30 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6AF5B6EDDC
 for <nouveau@lists.freedesktop.org>; Thu, 26 Sep 2019 18:44:29 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 67FE772162; Thu, 26 Sep 2019 18:44:29 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Thu, 26 Sep 2019 18:44:29 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: 7.7 (2012.06)
X-Bugzilla-Keywords: regression
X-Bugzilla-Severity: major
X-Bugzilla-Who: maris.nartiss@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: high
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-108615-8800-cf3yWf0QtU@http.bugs.freedesktop.org/>
In-Reply-To: <bug-108615-8800@http.bugs.freedesktop.org/>
References: <bug-108615-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 108615] [NVE7] changing resolution causes blank
 screen
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
Content-Type: multipart/mixed; boundary="===============0120968533=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0120968533==
Content-Type: multipart/alternative; boundary="15695234693.Adf752Bce.17896"
Content-Transfer-Encoding: 7bit


--15695234693.Adf752Bce.17896
Date: Thu, 26 Sep 2019 18:44:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108615

Maris Nartiss <maris.nartiss@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |maris.nartiss@gmail.com

--- Comment #8 from Maris Nartiss <maris.nartiss@gmail.com> ---
Created attachment 145527
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145527&action=3Dedit
Kernel log with a switch from native to lower resolution

Phil Turmel =E2=80=93 I am not certain if your issue is the same as the rep=
orter has.
I do have exactly same symptoms =E2=80=93 after changing resolution to not =
native, I
get black screen with backlight on. It is not an DE or WM issue, as I was
testing with bare xinit session. If there are other outputs active, they st=
ill
show picture just fine (split screen or clone mode). Thus, as jbytecoder wr=
ote,
X is still fine, just nothing goes to particular output device.

G98M (NV50 family) card tested with kernel 5.0 and 5.3.

Attached dmesg was generated after a reboot, stopping sddm, starting xinit
session and changing resolution to 1024x768 (native is 1440x900).

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15695234693.Adf752Bce.17896
Date: Thu, 26 Sep 2019 18:44:29 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:maris.nar=
tiss&#64;gmail.com" title=3D"Maris Nartiss &lt;maris.nartiss&#64;gmail.com&=
gt;"> <span class=3D"fn">Maris Nartiss</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVE7] changing resolution causes blank screen"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108615">bug 10861=
5</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>maris.nartiss&#64;gmail.com
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVE7] changing resolution causes blank screen"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108615#c8">Commen=
t # 8</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVE7] changing resolution causes blank screen"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108615">bug 10861=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
maris.nartiss&#64;gmail.com" title=3D"Maris Nartiss &lt;maris.nartiss&#64;g=
mail.com&gt;"> <span class=3D"fn">Maris Nartiss</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145527=
" name=3D"attach_145527" title=3D"Kernel log with a switch from native to l=
ower resolution">attachment 145527</a> <a href=3D"attachment.cgi?id=3D14552=
7&amp;action=3Dedit" title=3D"Kernel log with a switch from native to lower=
 resolution">[details]</a></span>
Kernel log with a switch from native to lower resolution

Phil Turmel =E2=80=93 I am not certain if your issue is the same as the rep=
orter has.
I do have exactly same symptoms =E2=80=93 after changing resolution to not =
native, I
get black screen with backlight on. It is not an DE or WM issue, as I was
testing with bare xinit session. If there are other outputs active, they st=
ill
show picture just fine (split screen or clone mode). Thus, as jbytecoder wr=
ote,
X is still fine, just nothing goes to particular output device.

G98M (NV50 family) card tested with kernel 5.0 and 5.3.

Attached dmesg was generated after a reboot, stopping sddm, starting xinit
session and changing resolution to 1024x768 (native is 1440x900).</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15695234693.Adf752Bce.17896--

--===============0120968533==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0120968533==--
