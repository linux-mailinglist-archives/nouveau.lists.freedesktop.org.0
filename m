Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD5E1E808
	for <lists+nouveau@lfdr.de>; Wed, 15 May 2019 07:51:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E673B891DB;
	Wed, 15 May 2019 05:51:41 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 18413891DB
 for <nouveau@lists.freedesktop.org>; Wed, 15 May 2019 05:51:41 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 1429E721CD; Wed, 15 May 2019 05:51:41 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Wed, 15 May 2019 05:51:41 +0000
X-Bugzilla-Reason: AssignedTo QAcontact
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/DRI/nouveau
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: randrik@mail.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 qa_contact attachments.created
Message-ID: <bug-110679-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 110679] New: va-api scaling with nv50-class cards
 incomplete?
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
Content-Type: multipart/mixed; boundary="===============1662467974=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============1662467974==
Content-Type: multipart/alternative; boundary="15578995010.3dcFbdEB.26563"
Content-Transfer-Encoding: 7bit


--15578995010.3dcFbdEB.26563
Date: Wed, 15 May 2019 05:51:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110679

            Bug ID: 110679
           Summary: va-api scaling with nv50-class cards incomplete?
           Product: Mesa
           Version: git
          Hardware: x86 (IA32)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau@lists.freedesktop.org
          Reporter: randrik@mail.ru
        QA Contact: nouveau@lists.freedesktop.org

Created attachment 144278
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144278&action=3Dedit
ffmpeg's output and command line

Hello!

I was trying to find answer to 'good ffmpeg commandline showing how to use
scale_vaapi filter' [1], but unfortunately none of my attempts worked  for =
me
:/

Mesa/va state tarcker:
glxinfo | grep OpenGL
OpenGL vendor string: nouveau
OpenGL renderer string: NV92
OpenGL core profile version string: 3.3 (Core Profile) Mesa 19.2.0-devel
(git-4fd8161773)
OpenGL core profile shading language version string: 3.30
OpenGL core profile context flags: (none)
OpenGL core profile profile mask: core profile
OpenGL core profile extensions:
OpenGL version string: 3.3 (Compatibility Profile) Mesa 19.2.0-devel
(git-4fd8161773)
OpenGL shading language version string: 3.30
OpenGL context flags: (none)
OpenGL profile mask: compatibility profile
OpenGL extensions:
OpenGL ES profile version string: OpenGL ES 3.0 Mesa 19.2.0-devel
(git-4fd8161773)
OpenGL ES profile shading language version string: OpenGL ES GLSL ES 3.00
OpenGL ES profile extensions:


vainfo:
vainfo
libva info: VA-API version 0.40.0
libva info: va_getDriverName() returns 0
libva info: Trying to open /usr/X11R7/lib/dri/nouveau_drv_video.so
libva info: Found init function __vaDriverInit_0_40
libva info: va_openDriver() returns 0
vainfo: VA-API version: 0.40 (libva )
vainfo: Driver version: Mesa Gallium driver 19.2.0-devel for NV92
vainfo: Supported profile and entrypoints
      VAProfileMPEG2Simple            : VAEntrypointVLD
      VAProfileMPEG2Simple            : VAEntrypointEncSlice
      VAProfileMPEG2Main              : VAEntrypointVLD
      VAProfileMPEG2Main              : VAEntrypointEncSlice
      VAProfileNone                   : VAEntrypointVideoProc


First, I think EncSlice lines are invalid (or mesa can magically (shaders?)
_encode_ mpeg2 videos?)

Second .. ffmpeg command failed for me :/
ffmpeg -vaapi_device /dev/dri/renderD128 -benchmark -c:v libdav1d   -i
/mnt/sdb1/Stream2_AV1_720p_3.2mbps.webm  -vf
format=3Dnv12,hwupload,scale_vaapi=3Dw=3D240:h=3D120 -map 0:v:0 -v trace -f=
 null -
ffmpeg version N-93862-gf49cec2ba8 Copyright (c) 2000-2019 the FFmpeg
developers
  built with gcc 5.5.0 (GCC)

[skip]

Applying option vaapi_device (set VAAPI hardware device (DRM path or X11
display name)) with argument /dev/dri/renderD128.
[AVHWDeviceContext @ 0xaef7d00] Opened VA display via DRM device
/dev/dri/renderD128.
libva info: VA-API version 0.40.0
libva info: va_getDriverName() returns 0
libva info: Trying to open /usr/X11R7/lib/dri/nouveau_drv_video.so
libva info: Found init function __vaDriverInit_0_40
libva info: va_openDriver() returns 0
[AVHWDeviceContext @ 0xaef7d00] Initialised VAAPI connection: version 0.40
[AVHWDeviceContext @ 0xaef7d00] Format 0x3231564e -> nv12.
[AVHWDeviceContext @ 0xaef7d00] Format 0x30313050 -> p010le.
[AVHWDeviceContext @ 0xaef7d00] Format 0x36313050 -> unknown.
[AVHWDeviceContext @ 0xaef7d00] Format 0x32315659 -> yuv420p.
[AVHWDeviceContext @ 0xaef7d00] Format 0x56595559 -> unknown.
[AVHWDeviceContext @ 0xaef7d00] Format 0x59565955 -> uyvy422.
[AVHWDeviceContext @ 0xaef7d00] Format 0x41524742 -> bgra.
[AVHWDeviceContext @ 0xaef7d00] Format 0x41424752 -> rgba.
[AVHWDeviceContext @ 0xaef7d00] Format 0x58524742 -> bgr0.
[AVHWDeviceContext @ 0xaef7d00] Format 0x58424752 -> rgb0.
[AVHWDeviceContext @ 0xaef7d00] VAAPI driver: Mesa Gallium driver 19.2.0-de=
vel
for NV92.
[AVHWDeviceContext @ 0xaef7d00] Driver not found in known nonstandard list,
using standard behaviour.

[skip]

[Parsed_format_0 @ 0xaf4dcc0] Setting 'pix_fmts' to value 'nv12'
[Parsed_scale_vaapi_2 @ 0xb005a40] Setting 'w' to value '240'
[Parsed_scale_vaapi_2 @ 0xb005a40] Setting 'h' to value '120'
[graph 0 input from stream 0:0 @ 0xb006300] Setting 'video_size' to value
'1280x720'
[graph 0 input from stream 0:0 @ 0xb006300] Setting 'pix_fmt' to value '0'
[graph 0 input from stream 0:0 @ 0xb006300] Setting 'time_base' to value
'1/1000'
[graph 0 input from stream 0:0 @ 0xb006300] Setting 'pixel_aspect' to value
'1/1'
[graph 0 input from stream 0:0 @ 0xb006300] Setting 'sws_param' to value
'flags=3D2'
[graph 0 input from stream 0:0 @ 0xb006300] Setting 'frame_rate' to value
'25/1'
[graph 0 input from stream 0:0 @ 0xb006300] w:1280 h:720 pixfmt:yuv420p
tb:1/1000 fr:25/1 sar:1/1 sws_param:flags=3D2
[auto_scaler_0 @ 0xb007b40] Setting 'flags' to value 'bicubic'
[auto_scaler_0 @ 0xb007b40] w:iw h:ih flags:'bicubic' interl:0
[Parsed_format_0 @ 0xaf4dcc0] auto-inserting filter 'auto_scaler_0' between=
 the
filter 'graph 0 input from stream 0:0' and the filter 'Parsed_format_0'
[AVFilterGraph @ 0xaf3ed00] query_formats: 5 queried, 3 merged, 1 already d=
one,
0 delayed
[auto_scaler_0 @ 0xb007b40] w:1280 h:720 fmt:yuv420p sar:1/1 -> w:1280 h:720
fmt:nv12 sar:1/1 flags:0x4
[hwupload @ 0xaf4e200] Surface format is nv12.
[AVHWFramesContext @ 0xaf4e4c0] Created surface 0x1.
[AVHWFramesContext @ 0xaf4e4c0] Direct mapping disabled: deriving image does
not work: 1 (operation failed).
[AVHWFramesContext @ 0xb08d2c0] Created surface 0x3.
[AVHWFramesContext @ 0xb08d2c0] Direct mapping disabled: deriving image does
not work: 1 (operation failed).
[AVHWFramesContext @ 0xb08d2c0] Created surface 0x4.
[AVHWFramesContext @ 0xb08d2c0] Created surface 0x5.
[AVHWFramesContext @ 0xb08d2c0] Created surface 0x6.
[AVHWFramesContext @ 0xb08d2c0] Created surface 0x7.
[AVHWFramesContext @ 0xb08d2c0] Created surface 0x8.
[AVHWFramesContext @ 0xb08d2c0] Created surface 0x9.
[AVHWFramesContext @ 0xb08d2c0] Created surface 0xa.
[AVHWFramesContext @ 0xb08d2c0] Created surface 0xb.
[AVHWFramesContext @ 0xb08d2c0] Created surface 0xc.
[AVHWFramesContext @ 0xaf4e4c0] Map surface 0x1.
[AVHWFramesContext @ 0xaf4e4c0] Unmap surface 0x1.
[Parsed_scale_vaapi_2 @ 0xb005a40] Filter input: vaapi_vld, 1280x720 (0).
[Parsed_scale_vaapi_2 @ 0xb005a40] Using surface 0x1 for scale input.
[Parsed_scale_vaapi_2 @ 0xb005a40] Using surface 0xc for scale output.
[Parsed_scale_vaapi_2 @ 0xb005a40] Pipeline parameter buffer is 0xe.
[Parsed_scale_vaapi_2 @ 0xb005a40] Failed to render parameter buffer: 2
(resource allocation failed).
Error while filtering: Input/output error
Failed to inject frame into filter network: Input/output error
Error while processing the decoded data for stream #0:0
bench: maxrss=3D106420kB
[AVIOContext @ 0xaf40640] Statistics: 759514 bytes read, 0 seeks
Conversion failed!

Ow :( [full log attached]

Note, i use libva1:

libva-1.8.3

Can libva2 be installed in parallel with libva1 ?

[1] - https://lists.cinelerra-gg.org/pipermail/cin/2019-May/000665.html

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--15578995010.3dcFbdEB.26563
Date: Wed, 15 May 2019 05:51:41 +0000
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
   title=3D"NEW - va-api scaling with nv50-class cards incomplete?"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110679">110679</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>va-api scaling with nv50-class cards incomplete?
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>git
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86 (IA32)
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
          <td>randrik&#64;mail.ru
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144278=
" name=3D"attach_144278" title=3D"ffmpeg's output and command line">attachm=
ent 144278</a> <a href=3D"attachment.cgi?id=3D144278&amp;action=3Dedit" tit=
le=3D"ffmpeg's output and command line">[details]</a></span>
ffmpeg's output and command line

Hello!

I was trying to find answer to 'good ffmpeg commandline showing how to use
scale_vaapi filter' [1], but unfortunately none of my attempts worked  for =
me
:/

Mesa/va state tarcker:
glxinfo | grep OpenGL
OpenGL vendor string: nouveau
OpenGL renderer string: NV92
OpenGL core profile version string: 3.3 (Core Profile) Mesa 19.2.0-devel
(git-4fd8161773)
OpenGL core profile shading language version string: 3.30
OpenGL core profile context flags: (none)
OpenGL core profile profile mask: core profile
OpenGL core profile extensions:
OpenGL version string: 3.3 (Compatibility Profile) Mesa 19.2.0-devel
(git-4fd8161773)
OpenGL shading language version string: 3.30
OpenGL context flags: (none)
OpenGL profile mask: compatibility profile
OpenGL extensions:
OpenGL ES profile version string: OpenGL ES 3.0 Mesa 19.2.0-devel
(git-4fd8161773)
OpenGL ES profile shading language version string: OpenGL ES GLSL ES 3.00
OpenGL ES profile extensions:


vainfo:
vainfo
libva info: VA-API version 0.40.0
libva info: va_getDriverName() returns 0
libva info: Trying to open /usr/X11R7/lib/dri/nouveau_drv_video.so
libva info: Found init function __vaDriverInit_0_40
libva info: va_openDriver() returns 0
vainfo: VA-API version: 0.40 (libva )
vainfo: Driver version: Mesa Gallium driver 19.2.0-devel for NV92
vainfo: Supported profile and entrypoints
      VAProfileMPEG2Simple            : VAEntrypointVLD
      VAProfileMPEG2Simple            : VAEntrypointEncSlice
      VAProfileMPEG2Main              : VAEntrypointVLD
      VAProfileMPEG2Main              : VAEntrypointEncSlice
      VAProfileNone                   : VAEntrypointVideoProc


First, I think EncSlice lines are invalid (or mesa can magically (shaders?)
_encode_ mpeg2 videos?)

Second .. ffmpeg command failed for me :/
ffmpeg -vaapi_device /dev/dri/renderD128 -benchmark -c:v libdav1d   -i
/mnt/sdb1/Stream2_AV1_720p_3.2mbps.webm  -vf
format=3Dnv12,hwupload,scale_vaapi=3Dw=3D240:h=3D120 -map 0:v:0 -v trace -f=
 null -
ffmpeg version N-93862-gf49cec2ba8 Copyright (c) 2000-2019 the FFmpeg
developers
  built with gcc 5.5.0 (GCC)

[skip]

Applying option vaapi_device (set VAAPI hardware device (DRM path or X11
display name)) with argument /dev/dri/renderD128.
[AVHWDeviceContext &#64; 0xaef7d00] Opened VA display via DRM device
/dev/dri/renderD128.
libva info: VA-API version 0.40.0
libva info: va_getDriverName() returns 0
libva info: Trying to open /usr/X11R7/lib/dri/nouveau_drv_video.so
libva info: Found init function __vaDriverInit_0_40
libva info: va_openDriver() returns 0
[AVHWDeviceContext &#64; 0xaef7d00] Initialised VAAPI connection: version 0=
.40
[AVHWDeviceContext &#64; 0xaef7d00] Format 0x3231564e -&gt; nv12.
[AVHWDeviceContext &#64; 0xaef7d00] Format 0x30313050 -&gt; p010le.
[AVHWDeviceContext &#64; 0xaef7d00] Format 0x36313050 -&gt; unknown.
[AVHWDeviceContext &#64; 0xaef7d00] Format 0x32315659 -&gt; yuv420p.
[AVHWDeviceContext &#64; 0xaef7d00] Format 0x56595559 -&gt; unknown.
[AVHWDeviceContext &#64; 0xaef7d00] Format 0x59565955 -&gt; uyvy422.
[AVHWDeviceContext &#64; 0xaef7d00] Format 0x41524742 -&gt; bgra.
[AVHWDeviceContext &#64; 0xaef7d00] Format 0x41424752 -&gt; rgba.
[AVHWDeviceContext &#64; 0xaef7d00] Format 0x58524742 -&gt; bgr0.
[AVHWDeviceContext &#64; 0xaef7d00] Format 0x58424752 -&gt; rgb0.
[AVHWDeviceContext &#64; 0xaef7d00] VAAPI driver: Mesa Gallium driver 19.2.=
0-devel
for NV92.
[AVHWDeviceContext &#64; 0xaef7d00] Driver not found in known nonstandard l=
ist,
using standard behaviour.

[skip]

[Parsed_format_0 &#64; 0xaf4dcc0] Setting 'pix_fmts' to value 'nv12'
[Parsed_scale_vaapi_2 &#64; 0xb005a40] Setting 'w' to value '240'
[Parsed_scale_vaapi_2 &#64; 0xb005a40] Setting 'h' to value '120'
[graph 0 input from stream 0:0 &#64; 0xb006300] Setting 'video_size' to val=
ue
'1280x720'
[graph 0 input from stream 0:0 &#64; 0xb006300] Setting 'pix_fmt' to value =
'0'
[graph 0 input from stream 0:0 &#64; 0xb006300] Setting 'time_base' to value
'1/1000'
[graph 0 input from stream 0:0 &#64; 0xb006300] Setting 'pixel_aspect' to v=
alue
'1/1'
[graph 0 input from stream 0:0 &#64; 0xb006300] Setting 'sws_param' to value
'flags=3D2'
[graph 0 input from stream 0:0 &#64; 0xb006300] Setting 'frame_rate' to val=
ue
'25/1'
[graph 0 input from stream 0:0 &#64; 0xb006300] w:1280 h:720 pixfmt:yuv420p
tb:1/1000 fr:25/1 sar:1/1 sws_param:flags=3D2
[auto_scaler_0 &#64; 0xb007b40] Setting 'flags' to value 'bicubic'
[auto_scaler_0 &#64; 0xb007b40] w:iw h:ih flags:'bicubic' interl:0
[Parsed_format_0 &#64; 0xaf4dcc0] auto-inserting filter 'auto_scaler_0' bet=
ween the
filter 'graph 0 input from stream 0:0' and the filter 'Parsed_format_0'
[AVFilterGraph &#64; 0xaf3ed00] query_formats: 5 queried, 3 merged, 1 alrea=
dy done,
0 delayed
[auto_scaler_0 &#64; 0xb007b40] w:1280 h:720 fmt:yuv420p sar:1/1 -&gt; w:12=
80 h:720
fmt:nv12 sar:1/1 flags:0x4
[hwupload &#64; 0xaf4e200] Surface format is nv12.
[AVHWFramesContext &#64; 0xaf4e4c0] Created surface 0x1.
[AVHWFramesContext &#64; 0xaf4e4c0] Direct mapping disabled: deriving image=
 does
not work: 1 (operation failed).
[AVHWFramesContext &#64; 0xb08d2c0] Created surface 0x3.
[AVHWFramesContext &#64; 0xb08d2c0] Direct mapping disabled: deriving image=
 does
not work: 1 (operation failed).
[AVHWFramesContext &#64; 0xb08d2c0] Created surface 0x4.
[AVHWFramesContext &#64; 0xb08d2c0] Created surface 0x5.
[AVHWFramesContext &#64; 0xb08d2c0] Created surface 0x6.
[AVHWFramesContext &#64; 0xb08d2c0] Created surface 0x7.
[AVHWFramesContext &#64; 0xb08d2c0] Created surface 0x8.
[AVHWFramesContext &#64; 0xb08d2c0] Created surface 0x9.
[AVHWFramesContext &#64; 0xb08d2c0] Created surface 0xa.
[AVHWFramesContext &#64; 0xb08d2c0] Created surface 0xb.
[AVHWFramesContext &#64; 0xb08d2c0] Created surface 0xc.
[AVHWFramesContext &#64; 0xaf4e4c0] Map surface 0x1.
[AVHWFramesContext &#64; 0xaf4e4c0] Unmap surface 0x1.
[Parsed_scale_vaapi_2 &#64; 0xb005a40] Filter input: vaapi_vld, 1280x720 (0=
).
[Parsed_scale_vaapi_2 &#64; 0xb005a40] Using surface 0x1 for scale input.
[Parsed_scale_vaapi_2 &#64; 0xb005a40] Using surface 0xc for scale output.
[Parsed_scale_vaapi_2 &#64; 0xb005a40] Pipeline parameter buffer is 0xe.
[Parsed_scale_vaapi_2 &#64; 0xb005a40] Failed to render parameter buffer: 2
(resource allocation failed).
Error while filtering: Input/output error
Failed to inject frame into filter network: Input/output error
Error while processing the decoded data for stream #0:0
bench: maxrss=3D106420kB
[AVIOContext &#64; 0xaf40640] Statistics: 759514 bytes read, 0 seeks
Conversion failed!

Ow :( [full log attached]

Note, i use libva1:

libva-1.8.3

Can libva2 be installed in parallel with libva1 ?

[1] - <a href=3D"https://lists.cinelerra-gg.org/pipermail/cin/2019-May/0006=
65.html">https://lists.cinelerra-gg.org/pipermail/cin/2019-May/000665.html<=
/a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
          <li>You are the QA Contact for the bug.</li>
      </ul>
    </body>
</html>=

--15578995010.3dcFbdEB.26563--

--===============1662467974==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1662467974==--
