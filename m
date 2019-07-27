Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6DD775A1
	for <lists+nouveau@lfdr.de>; Sat, 27 Jul 2019 03:34:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 447E16EE79;
	Sat, 27 Jul 2019 01:34:55 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 44C106EE79
 for <nouveau@lists.freedesktop.org>; Sat, 27 Jul 2019 01:34:54 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 3A92172167; Sat, 27 Jul 2019 01:34:54 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Sat, 27 Jul 2019 01:34:54 +0000
X-Bugzilla-Reason: QAcontact AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/DRI/nouveau
X-Bugzilla-Version: 19.1
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: liewkj@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111213-8800-e7LdgIXkt2@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111213-8800@http.bugs.freedesktop.org/>
References: <bug-111213-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 111213] VA-API nouveau SIGSEGV and asserts
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
Content-Type: multipart/mixed; boundary="===============0508735141=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0508735141==
Content-Type: multipart/alternative; boundary="15641912940.AaEce770A.11890"
Content-Transfer-Encoding: 7bit


--15641912940.AaEce770A.11890
Date: Sat, 27 Jul 2019 01:34:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111213

--- Comment #6 from KJ Liew <liewkj@yahoo.com> ---
I don't know how you had verified VDPAU to make sure it is working. Running
vdpauinfo is not enough. I used the VA-API translation layer for VDPAU back=
end
since my goal is to get VA-API. I had also verified that the VA-API transla=
tion
layer worked with nvidia-390xx propriety blobs and Chromium-vaapi accelerat=
ed
H264 playback.

The change *ONLY* fixed "vainfo & vdpauinfo SIGSEGV due to NULL pointer".

$ LIBVA_DRIVER_NAME=3Dvdpau vainfo
vainfo: VA-API version: 1.5 (libva 2.5.0)
vainfo: Driver version: Splitted-Desktop Systems VDPAU backend for VA-API -
0.7.4
vainfo: Supported profile and entrypoints
      VAProfileMPEG2Simple            : VAEntrypointVLD
      VAProfileMPEG2Main              : VAEntrypointVLD
      VAProfileMPEG4Simple            : VAEntrypointVLD
      VAProfileMPEG4AdvancedSimple    : VAEntrypointVLD
      VAProfileH264ConstrainedBaseline: VAEntrypointVLD
      VAProfileH264Main               : VAEntrypointVLD
      VAProfileH264High               : VAEntrypointVLD
      VAProfileVC1Simple              : VAEntrypointVLD
      VAProfileVC1Main                : VAEntrypointVLD
      VAProfileVC1Advanced            : VAEntrypointVLD


$ LIBVA_DRIVER_NAME=3Dvdpau VDPAU_DRIVER=3Dnouveau chromium
[19735:19735:0726/182126.662312:ERROR:vaapi_wrapper.cc(455)]
GetConfigAttributes failed for va_profile 13
[19735:19735:0726/182126.662353:ERROR:vaapi_wrapper.cc(455)]
GetConfigAttributes failed for va_profile 6
[19735:19735:0726/182126.662359:ERROR:vaapi_wrapper.cc(455)]
GetConfigAttributes failed for va_profile 7
[19735:19735:0726/182126.764805:ERROR:sandbox_linux.cc(368)]
InitializeSandbox() called with multiple threads in process gpu-process.
[19735:19735:0726/182126.808082:ERROR:buffer_manager.cc(488)]
[.DisplayCompositor]GL ERROR :GL_INVALID_OPERATION : glBufferData: <- error
from previous GL command
romium/chromium --type=3Dgpu-process
--field-trial-handle=3D7302155616383548209,8433935369873353489,131072
--disable-breakpad
--gpu-preferences=3DKAAAAAAAAAAgAACgAQAAAAAAAAAAAGAAAAAAAAAAAAAIAAAAAAAAAAg=
AAAAAAAAA
--service-request-channel-token=3D6382519074401266972:
../mesa-19.1.3/src/gallium/drivers/nouveau/nvc0/nvc0_video.c:43:
nvc0_decoder_begin_frame: Assertion `ret =3D=3D 2' failed.

There was a long pause, I think the GPU process crashed and then restarted =
with
more lengthy logs spit until Chromium was killed

[20217:20217:0726/182241.032544:ERROR:vaapi_wrapper.cc(455)]
GetConfigAttributes failed for va_profile 13
[20217:20217:0726/182241.032617:ERROR:vaapi_wrapper.cc(455)]
GetConfigAttributes failed for va_profile 6
[20217:20217:0726/182241.032636:ERROR:vaapi_wrapper.cc(455)]
GetConfigAttributes failed for va_profile 7
[20217:20217:0726/182241.120438:ERROR:sandbox_linux.cc(368)]
InitializeSandbox() called with multiple threads in process gpu-process.
[20217:20217:0726/182241.149352:ERROR:buffer_manager.cc(488)]
[.DisplayCompositor]GL ERROR :GL_INVALID_OPERATION : glBufferData: <- error
from previous GL command
[20217:20217:0726/182241.204625:ERROR:gles2_cmd_decoder.cc(18461)]
[.DisplayCompositor]GL ERROR :GL_INVALID_OPERATION :
glCreateAndConsumeTextureCHROMIUM: invalid mailbox name
[20217:20217:0726/182241.208930:ERROR:gles2_cmd_decoder.cc(10734)]
[.DisplayCompositor]RENDER WARNING: texture bound to texture unit 0 is not
renderable. It maybe non-power-of-2 and have incompatible texture filtering.
[20217:20217:0726/182255.379961:ERROR:gles2_cmd_decoder.cc(10734)]
[.DisplayCompositor]RENDER WARNING: texture bound to texture unit 0 is not
renderable. It maybe non-power-of-2 and have incompatible texture filtering.
[20217:20217:0726/182255.400308:ERROR:gles2_cmd_decoder.cc(10734)]
[.DisplayCompositor]RENDER WARNING: texture bound to texture unit 0 is not
renderable. It maybe non-power-of-2 and have incompatible texture filtering.
[20217:20217:0726/182256.316376:ERROR:gles2_cmd_decoder.cc(10734)]
[.DisplayCompositor]RENDER WARNING: texture bound to texture unit 0 is not
renderable. It maybe non-power-of-2 and have incompatible texture filtering.
[20217:20217:0726/182256.344654:ERROR:gles2_cmd_decoder.cc(10734)]
[.DisplayCompositor]RENDER WARNING: texture bound to texture unit 0 is not
renderable. It maybe non-power-of-2 and have incompatible texture filtering.
[20217:20217:0726/182256.350918:ERROR:gles2_cmd_decoder.cc(10734)]
[.DisplayCompositor]RENDER WARNING: texture bound to texture unit 0 is not
renderable. It maybe non-power-of-2 and have incompatible texture filtering.
[20217:20217:0726/182256.363405:ERROR:gles2_cmd_decoder.cc(10734)]
[.DisplayCompositor]RENDER WARNING: texture bound to texture unit 0 is not
renderable. It maybe non-power-of-2 and have incompatible texture filtering.
[20217:20217:0726/182256.394713:ERROR:gles2_cmd_decoder.cc(10734)]
[.DisplayCompositor]RENDER WARNING: texture bound to texture unit 0 is not
renderable. It maybe non-power-of-2 and have incompatible texture filtering.
[20217:20217:0726/182256.396760:ERROR:gles2_cmd_decoder.cc(10734)]
[.DisplayCompositor]RENDER WARNING: texture bound to texture unit 0 is not
renderable. It maybe non-power-of-2 and have incompatible texture filtering.
[20217:20217:0726/182256.411122:ERROR:gles2_cmd_decoder.cc(10734)]
[.DisplayCompositor]RENDER WARNING: texture bound to texture unit 0 is not
renderable. It maybe non-power-of-2 and have incompatible texture filtering.
[20217:20217:0726/182256.442865:ERROR:gles2_cmd_decoder.cc(10734)]
[.DisplayCompositor]RENDER WARNING: texture bound to texture unit 0 is not
renderable. It maybe non-power-of-2 and have incompatible texture filtering.
[20217:20217:0726/182256.445224:ERROR:gles2_cmd_decoder.cc(10734)]
[.DisplayCompositor]RENDER WARNING: texture bound to texture unit 0 is not
renderable. It maybe non-power-of-2 and have incompatible texture filtering.
[20217:20217:0726/182256.503684:ERROR:gles2_cmd_decoder.cc(10734)]
[.DisplayCompositor]RENDER WARNING: texture bound to texture unit 0 is not
renderable. It maybe non-power-of-2 and have incompatible texture filtering.
[20217:20217:0726/182256.530002:ERROR:gles2_cmd_decoder.cc(10734)]
[.DisplayCompositor]RENDER WARNING: texture bound to texture unit 0 is not
renderable. It maybe non-power-of-2 and have incompatible texture filtering.
[20217:20217:0726/182256.547899:ERROR:gles2_cmd_decoder.cc(10734)]
[.DisplayCompositor]RENDER WARNING: texture bound to texture unit 0 is not
renderable. It maybe non-power-of-2 and have incompatible texture filtering.
[20217:20217:0726/182256.583440:ERROR:gles2_cmd_decoder.cc(10734)]
[.DisplayCompositor]RENDER WARNING: texture bound to texture unit 0 is not
renderable. It maybe non-power-of-2 and have incompatible texture filtering.
[20217:20217:0726/182256.589853:ERROR:gles2_cmd_decoder.cc(10734)]
[.DisplayCompositor]RENDER WARNING: texture bound to texture unit 0 is not
renderable. It maybe non-power-of-2 and have incompatible texture filtering.

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15641912940.AaEce770A.11890
Date: Sat, 27 Jul 2019 01:34:54 +0000
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
   title=3D"NEW - VA-API nouveau SIGSEGV and asserts"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111213#c6">Commen=
t # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - VA-API nouveau SIGSEGV and asserts"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111213">bug 11121=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
liewkj&#64;yahoo.com" title=3D"KJ Liew &lt;liewkj&#64;yahoo.com&gt;"> <span=
 class=3D"fn">KJ Liew</span></a>
</span></b>
        <pre>I don't know how you had verified VDPAU to make sure it is wor=
king. Running
vdpauinfo is not enough. I used the VA-API translation layer for VDPAU back=
end
since my goal is to get VA-API. I had also verified that the VA-API transla=
tion
layer worked with nvidia-390xx propriety blobs and Chromium-vaapi accelerat=
ed
H264 playback.

The change *ONLY* fixed &quot;vainfo &amp; vdpauinfo SIGSEGV due to NULL po=
inter&quot;.

$ LIBVA_DRIVER_NAME=3Dvdpau vainfo
vainfo: VA-API version: 1.5 (libva 2.5.0)
vainfo: Driver version: Splitted-Desktop Systems VDPAU backend for VA-API -
0.7.4
vainfo: Supported profile and entrypoints
      VAProfileMPEG2Simple            : VAEntrypointVLD
      VAProfileMPEG2Main              : VAEntrypointVLD
      VAProfileMPEG4Simple            : VAEntrypointVLD
      VAProfileMPEG4AdvancedSimple    : VAEntrypointVLD
      VAProfileH264ConstrainedBaseline: VAEntrypointVLD
      VAProfileH264Main               : VAEntrypointVLD
      VAProfileH264High               : VAEntrypointVLD
      VAProfileVC1Simple              : VAEntrypointVLD
      VAProfileVC1Main                : VAEntrypointVLD
      VAProfileVC1Advanced            : VAEntrypointVLD


$ LIBVA_DRIVER_NAME=3Dvdpau VDPAU_DRIVER=3Dnouveau chromium
[19735:19735:0726/182126.662312:ERROR:vaapi_wrapper.cc(455)]
GetConfigAttributes failed for va_profile 13
[19735:19735:0726/182126.662353:ERROR:vaapi_wrapper.cc(455)]
GetConfigAttributes failed for va_profile 6
[19735:19735:0726/182126.662359:ERROR:vaapi_wrapper.cc(455)]
GetConfigAttributes failed for va_profile 7
[19735:19735:0726/182126.764805:ERROR:sandbox_linux.cc(368)]
InitializeSandbox() called with multiple threads in process gpu-process.
[19735:19735:0726/182126.808082:ERROR:buffer_manager.cc(488)]
[.DisplayCompositor]GL ERROR :GL_INVALID_OPERATION : glBufferData: &lt;- er=
ror
from previous GL command
romium/chromium --type=3Dgpu-process
--field-trial-handle=3D7302155616383548209,8433935369873353489,131072
--disable-breakpad
--gpu-preferences=3DKAAAAAAAAAAgAACgAQAAAAAAAAAAAGAAAAAAAAAAAAAIAAAAAAAAAAg=
AAAAAAAAA
--service-request-channel-token=3D6382519074401266972:
../mesa-19.1.3/src/gallium/drivers/nouveau/nvc0/nvc0_video.c:43:
nvc0_decoder_begin_frame: Assertion `ret =3D=3D 2' failed.

There was a long pause, I think the GPU process crashed and then restarted =
with
more lengthy logs spit until Chromium was killed

[20217:20217:0726/182241.032544:ERROR:vaapi_wrapper.cc(455)]
GetConfigAttributes failed for va_profile 13
[20217:20217:0726/182241.032617:ERROR:vaapi_wrapper.cc(455)]
GetConfigAttributes failed for va_profile 6
[20217:20217:0726/182241.032636:ERROR:vaapi_wrapper.cc(455)]
GetConfigAttributes failed for va_profile 7
[20217:20217:0726/182241.120438:ERROR:sandbox_linux.cc(368)]
InitializeSandbox() called with multiple threads in process gpu-process.
[20217:20217:0726/182241.149352:ERROR:buffer_manager.cc(488)]
[.DisplayCompositor]GL ERROR :GL_INVALID_OPERATION : glBufferData: &lt;- er=
ror
from previous GL command
[20217:20217:0726/182241.204625:ERROR:gles2_cmd_decoder.cc(18461)]
[.DisplayCompositor]GL ERROR :GL_INVALID_OPERATION :
glCreateAndConsumeTextureCHROMIUM: invalid mailbox name
[20217:20217:0726/182241.208930:ERROR:gles2_cmd_decoder.cc(10734)]
[.DisplayCompositor]RENDER WARNING: texture bound to texture unit 0 is not
renderable. It maybe non-power-of-2 and have incompatible texture filtering.
[20217:20217:0726/182255.379961:ERROR:gles2_cmd_decoder.cc(10734)]
[.DisplayCompositor]RENDER WARNING: texture bound to texture unit 0 is not
renderable. It maybe non-power-of-2 and have incompatible texture filtering.
[20217:20217:0726/182255.400308:ERROR:gles2_cmd_decoder.cc(10734)]
[.DisplayCompositor]RENDER WARNING: texture bound to texture unit 0 is not
renderable. It maybe non-power-of-2 and have incompatible texture filtering.
[20217:20217:0726/182256.316376:ERROR:gles2_cmd_decoder.cc(10734)]
[.DisplayCompositor]RENDER WARNING: texture bound to texture unit 0 is not
renderable. It maybe non-power-of-2 and have incompatible texture filtering.
[20217:20217:0726/182256.344654:ERROR:gles2_cmd_decoder.cc(10734)]
[.DisplayCompositor]RENDER WARNING: texture bound to texture unit 0 is not
renderable. It maybe non-power-of-2 and have incompatible texture filtering.
[20217:20217:0726/182256.350918:ERROR:gles2_cmd_decoder.cc(10734)]
[.DisplayCompositor]RENDER WARNING: texture bound to texture unit 0 is not
renderable. It maybe non-power-of-2 and have incompatible texture filtering.
[20217:20217:0726/182256.363405:ERROR:gles2_cmd_decoder.cc(10734)]
[.DisplayCompositor]RENDER WARNING: texture bound to texture unit 0 is not
renderable. It maybe non-power-of-2 and have incompatible texture filtering.
[20217:20217:0726/182256.394713:ERROR:gles2_cmd_decoder.cc(10734)]
[.DisplayCompositor]RENDER WARNING: texture bound to texture unit 0 is not
renderable. It maybe non-power-of-2 and have incompatible texture filtering.
[20217:20217:0726/182256.396760:ERROR:gles2_cmd_decoder.cc(10734)]
[.DisplayCompositor]RENDER WARNING: texture bound to texture unit 0 is not
renderable. It maybe non-power-of-2 and have incompatible texture filtering.
[20217:20217:0726/182256.411122:ERROR:gles2_cmd_decoder.cc(10734)]
[.DisplayCompositor]RENDER WARNING: texture bound to texture unit 0 is not
renderable. It maybe non-power-of-2 and have incompatible texture filtering.
[20217:20217:0726/182256.442865:ERROR:gles2_cmd_decoder.cc(10734)]
[.DisplayCompositor]RENDER WARNING: texture bound to texture unit 0 is not
renderable. It maybe non-power-of-2 and have incompatible texture filtering.
[20217:20217:0726/182256.445224:ERROR:gles2_cmd_decoder.cc(10734)]
[.DisplayCompositor]RENDER WARNING: texture bound to texture unit 0 is not
renderable. It maybe non-power-of-2 and have incompatible texture filtering.
[20217:20217:0726/182256.503684:ERROR:gles2_cmd_decoder.cc(10734)]
[.DisplayCompositor]RENDER WARNING: texture bound to texture unit 0 is not
renderable. It maybe non-power-of-2 and have incompatible texture filtering.
[20217:20217:0726/182256.530002:ERROR:gles2_cmd_decoder.cc(10734)]
[.DisplayCompositor]RENDER WARNING: texture bound to texture unit 0 is not
renderable. It maybe non-power-of-2 and have incompatible texture filtering.
[20217:20217:0726/182256.547899:ERROR:gles2_cmd_decoder.cc(10734)]
[.DisplayCompositor]RENDER WARNING: texture bound to texture unit 0 is not
renderable. It maybe non-power-of-2 and have incompatible texture filtering.
[20217:20217:0726/182256.583440:ERROR:gles2_cmd_decoder.cc(10734)]
[.DisplayCompositor]RENDER WARNING: texture bound to texture unit 0 is not
renderable. It maybe non-power-of-2 and have incompatible texture filtering.
[20217:20217:0726/182256.589853:ERROR:gles2_cmd_decoder.cc(10734)]
[.DisplayCompositor]RENDER WARNING: texture bound to texture unit 0 is not
renderable. It maybe non-power-of-2 and have incompatible texture filtering=
.</pre>
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

--15641912940.AaEce770A.11890--

--===============0508735141==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0508735141==--
