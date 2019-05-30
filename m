Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA8730103
	for <lists+nouveau@lfdr.de>; Thu, 30 May 2019 19:26:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F36B66E3DD;
	Thu, 30 May 2019 17:26:11 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 131296E3DA
 for <nouveau@lists.freedesktop.org>; Thu, 30 May 2019 17:26:10 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 0BBB272167; Thu, 30 May 2019 17:26:10 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Thu, 30 May 2019 17:26:10 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: newbytee@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-110797-8800-9mtkehAxwt@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110797-8800@http.bugs.freedesktop.org/>
References: <bug-110797-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 110797] No video if nomodeset is not set with GTX 460
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
Content-Type: multipart/mixed; boundary="===============0167739551=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0167739551==
Content-Type: multipart/alternative; boundary="15592371700.810aaC5.3046"
Content-Transfer-Encoding: 7bit


--15592371700.810aaC5.3046
Date: Thu, 30 May 2019 17:26:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110797

--- Comment #8 from Newbyte <newbytee@protonmail.com> ---
Created attachment 144384
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144384&action=3Dedit
Kernel log from boot with nouveau (log_buf_len=3D4M)

Note: I noticed that the kernel boot parameters blacklist nouveau. I attemp=
ted
to remove that, but in doing so I'm no longer able to ssh into the PC, so I
added them again (which is what this log contains).

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15592371700.810aaC5.3046
Date: Thu, 30 May 2019 17:26:10 +0000
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
   title=3D"NEW - No video if nomodeset is not set with GTX 460"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110797#c8">Commen=
t # 8</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - No video if nomodeset is not set with GTX 460"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110797">bug 11079=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
newbytee&#64;protonmail.com" title=3D"Newbyte &lt;newbytee&#64;protonmail.c=
om&gt;"> <span class=3D"fn">Newbyte</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144384=
" name=3D"attach_144384" title=3D"Kernel log from boot with nouveau (log_bu=
f_len=3D4M)">attachment 144384</a> <a href=3D"attachment.cgi?id=3D144384&am=
p;action=3Dedit" title=3D"Kernel log from boot with nouveau (log_buf_len=3D=
4M)">[details]</a></span>
Kernel log from boot with nouveau (log_buf_len=3D4M)

Note: I noticed that the kernel boot parameters blacklist nouveau. I attemp=
ted
to remove that, but in doing so I'm no longer able to ssh into the PC, so I
added them again (which is what this log contains).</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15592371700.810aaC5.3046--

--===============0167739551==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0167739551==--
