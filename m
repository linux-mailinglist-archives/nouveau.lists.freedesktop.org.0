Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA285372E6
	for <lists+nouveau@lfdr.de>; Mon, 30 May 2022 00:58:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0614210E5AD;
	Sun, 29 May 2022 22:58:34 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-oa1-x41.google.com (mail-oa1-x41.google.com
 [IPv6:2001:4860:4864:20::41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94C63112895
 for <nouveau@lists.freedesktop.org>; Sun, 29 May 2022 22:58:32 +0000 (UTC)
Received: by mail-oa1-x41.google.com with SMTP id
 586e51a60fabf-f2a4c51c45so12281412fac.9
 for <nouveau@lists.freedesktop.org>; Sun, 29 May 2022 15:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=9/YXqhZz+CiKORaZgdGOPpIcKfiahCzwx+9yWHqBiBM=;
 b=maDgdhTyqwD3EIWYf/EakQM1jEjtYixy1+zSaNto8y6gUJrEk4VMwNfn1izgTFcWG0
 KDl0SQjQVUcePSvtJGIM0R7ClGRjpfl4PbD8fdXhTmPBntTqvfSaHLIHQ/IPX4tum35c
 NkBB/+/nlsJTgYOQ5lFO+0RwoptBy6xsXA6cOgoxuN0PSMopE3HVgx0tmRaVoHIIgErp
 9VZ+EfPbxK2dqgtCeaPE+SiU64t+RDSB3pO4a3V0P91nEYsEGzLB5RsfiyeFZLsGgUKY
 jE3zIFd/BgUTM8n0tzSt1hJJaY+62BzWaHvzYZUFO/uygCTO0KiGs3YrfsWThL2a7Yn0
 TZwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=9/YXqhZz+CiKORaZgdGOPpIcKfiahCzwx+9yWHqBiBM=;
 b=eO+oWy8sGNhgz9Yf+unKV0eNMfc+TF2r64K7OlEQRk+oc3ebkqPuRfR/ZuTbYqSA5S
 iws60skx7ErHHltmw+H/tEQZXxMYIJea/Z1qOlKEAdjicXfeY7mnkbaLafAwemishB3I
 KCWh+uzbb2GvYl4iOxbh/A9/5Mi3bbg0QGdAa2uCmtn0rZ5DhWp3xDhJWEQJDtG1+x7L
 8gfVwwxPAlcTs6f0POSdKT6s4IXtz5vHgj2Qz7BRHa7Aglgzkk2MCUmugGJ/z4j3z4in
 y0cJfQxsnT3CQNOlBbvIBA2Db7NuBq7BZx4anmx/sQlabynzOAlNeeVFDhzo/IJW2lho
 ZNOQ==
X-Gm-Message-State: AOAM531iUTLo3akHtNOhc5VpxzzOrur7SlZ7mUKN4Z/qi68XygK1Smlq
 9Xn5v9JhRfFDWTDprPDu28i658ncdn0lbXWcjn1N7MPEvwPx1g==
X-Google-Smtp-Source: ABdhPJzsEYNE7Vnq5sal4uIMquSHK3Hi6rY9TFcSeGqPHIQPIOkG7ZfGyHdYDgE2wwGY+lkrz/OtZeUUVUnEA1ntFyE=
X-Received: by 2002:a05:6870:a792:b0:f3:1eca:5ba6 with SMTP id
 x18-20020a056870a79200b000f31eca5ba6mr2831917oao.212.1653865111675; Sun, 29
 May 2022 15:58:31 -0700 (PDT)
MIME-Version: 1.0
From: Joe <joe.on.list@gmail.com>
Date: Mon, 30 May 2022 00:58:22 +0200
Message-ID: <CAPmk3hBMuFo9ebX3=rwPqp9tQnPrF9J67LOdxn7QxGry-XVC-Q@mail.gmail.com>
To: nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: [Nouveau] Hardware decoding in video playback with Nvidia GT 218
 (NVA8)
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi all, I'm trying to make running hardware acceleration decoding on
my old GeForce 210 (AKA GT-218, or NVA8 / NV-50 Tesla family).
----------------------------------
02:00.0 VGA compatible controller [0300]: NVIDIA Corporation GT218
[GeForce 210] [10de:0a65] (rev a2)
----------------------------------

I usually used proprietary nvidia-legacy340.108 driver and it works
quite well even if I noticed some A-V sync (or a bit of frame
dropping) issues during video playback of some videos having 1080p and
60 FPS (h264 encoded). Those issues seem solved by turn off hardware
decoding.
With MPV player and closed nvidia driver I used options:

"-vo=3Dgpu -hwdec=3Dauto"

And it automatically chooses "vdpau" decoding. CPU rests on 5% of load
and so on...

But I read about good if not better performances of some nvidia cards
by using Nouveau open drivers, especially for old GPUs which could
have poorly updated/maintained proprietary driver. So I decided to
switch to open ones.

I'm using Slackware64-15.0 with multilib support.
It runs kernel 5.15.38.

I read on nouveau page about the need of some files extracted from
proprietary driver, a closed firmware for video hardware decoding. On
slackware it is provided by SlackBuilds community:

https://slackbuilds.org/repository/15.0/system/nvidia-firmware/

It populated /lib/firmware/nouveau with variuos files I think related to my=
 GPU:
----------------------------------------------
$ file /lib/firmware/nouveau/nva{3_{b,p,v},8}*
/lib/firmware/nouveau/nva3_bsp:    data
/lib/firmware/nouveau/nva3_ppp:    data
/lib/firmware/nouveau/nva3_vp:     data
/lib/firmware/nouveau/nva8_fuc084: symbolic link to nva3_bsp
/lib/firmware/nouveau/nva8_fuc085: symbolic link to nva3_vp
/lib/firmware/nouveau/nva8_fuc086: symbolic link to nva3_ppp
------------------------------------------------------------

I also enable "nouveau" in /etc/X11/xorg.conf.d/20-nouveau
------------------------------------------
$ cat /etc/X11/xorg.conf.d/20-nouveau.conf
Section "Device"
        Identifier "Nvidia card"
        Driver "nouveau"
EndSection
----------

Here is env-var VDPAU_DRIVER defined to "nouveau"
------------------------------------------
$ grep -v "^#\|^$" /etc/profile.d/vdpau.sh
export VDPAU_LOG=3D0
export VDPAU_DRIVER=3D"nouveau"
-----------------------------

On my system are installed:
---------------------
libvdpau-1.4-x86_64-3
libvdpau-compat32-1.4-x86_64-3compat32
--------------------------------------

The second one is related to multilib environment.

Now some infos about vdpau:
---------------------------
$ vdpauinfo
display: :0   screen: 0
API version: 1
Information string: G3DVL VDPAU Driver Shared Library version 1.0

Video surface:

name   width height types
-------------------------------------------
420     8192  8192  NV12 YV12
422     8192  8192  UYVY YUYV
444     8192  8192  Y8U8V8A8 V8U8Y8A8
420_16  8192  8192
422_16  8192  8192
444_16  8192  8192

Decoder capabilities:

name                        level macbs width height
----------------------------------------------------
MPEG1                           0  8192  2048  2048
MPEG2_SIMPLE                    3  8192  2048  2048
MPEG2_MAIN                      3  8192  2048  2048
H264_BASELINE                  41  8192  2048  2048
H264_MAIN                      41  8192  2048  2048
H264_HIGH                      41  8192  2048  2048
VC1_SIMPLE                      1  8190  2048  2048
VC1_MAIN                        2  8190  2048  2048
VC1_ADVANCED                    4  8190  2048  2048
MPEG4_PART2_SP                  3  8192  2048  2048
MPEG4_PART2_ASP                 5  8192  2048  2048
DIVX4_QMOBILE                  --- not supported ---
DIVX4_MOBILE                   --- not supported ---
DIVX4_HOME_THEATER             --- not supported ---
DIVX4_HD_1080P                 --- not supported ---
DIVX5_QMOBILE                  --- not supported ---
DIVX5_MOBILE                   --- not supported ---
DIVX5_HOME_THEATER             --- not supported ---
DIVX5_HD_1080P                 --- not supported ---
H264_CONSTRAINED_BASELINE      41  8192  2048  2048
H264_EXTENDED                  --- not supported ---
H264_PROGRESSIVE_HIGH          --- not supported ---
H264_CONSTRAINED_HIGH          --- not supported ---
H264_HIGH_444_PREDICTIVE       --- not supported ---
VP9_PROFILE_0                  --- not supported ---
VP9_PROFILE_1                  --- not supported ---
VP9_PROFILE_2                  --- not supported ---
VP9_PROFILE_3                  --- not supported ---
HEVC_MAIN                      --- not supported ---
HEVC_MAIN_10                   --- not supported ---
HEVC_MAIN_STILL                --- not supported ---
HEVC_MAIN_12                   --- not supported ---
HEVC_MAIN_444                  --- not supported ---
HEVC_MAIN_444_10               --- not supported ---
HEVC_MAIN_444_12               --- not supported ---

Output surface:

name              width height nat types
----------------------------------------------------
B8G8R8A8          8192  8192    y  NV12 YV12 UYVY YUYV Y8U8V8A8
V8U8Y8A8 P010 P016 A4I4 I4A4 A8I8 I8A8
R8G8B8A8          8192  8192    y  NV12 YV12 UYVY YUYV Y8U8V8A8
V8U8Y8A8 P010 P016 A4I4 I4A4 A8I8 I8A8
R10G10B10A2       8192  8192    y  NV12 YV12 UYVY YUYV Y8U8V8A8
V8U8Y8A8 P010 P016 A4I4 I4A4 A8I8 I8A8
B10G10R10A2       8192  8192    y  NV12 YV12 UYVY YUYV Y8U8V8A8
V8U8Y8A8 P010 P016 A4I4 I4A4 A8I8 I8A8

Bitmap surface:

name              width height
------------------------------
B8G8R8A8          8192  8192
R8G8B8A8          8192  8192
R10G10B10A2       8192  8192
B10G10R10A2       8192  8192
A8                8192  8192

Video mixer:

feature name                    sup
------------------------------------
DEINTERLACE_TEMPORAL             y
DEINTERLACE_TEMPORAL_SPATIAL     -
INVERSE_TELECINE                 -
NOISE_REDUCTION                  y
SHARPNESS                        y
LUMA_KEY                         y
HIGH QUALITY SCALING - L1        y
HIGH QUALITY SCALING - L2        -
HIGH QUALITY SCALING - L3        -
HIGH QUALITY SCALING - L4        -
HIGH QUALITY SCALING - L5        -
HIGH QUALITY SCALING - L6        -
HIGH QUALITY SCALING - L7        -
HIGH QUALITY SCALING - L8        -
HIGH QUALITY SCALING - L9        -

parameter name                  sup      min      max
-----------------------------------------------------
VIDEO_SURFACE_WIDTH              y        48     2048
VIDEO_SURFACE_HEIGHT             y        48     2048
CHROMA_TYPE                      y
LAYERS                           y         0        4

attribute name                  sup      min      max
-----------------------------------------------------
BACKGROUND_COLOR                 y
CSC_MATRIX                       y
NOISE_REDUCTION_LEVEL            y      0.00     1.00
SHARPNESS_LEVEL                  y     -1.00     1.00
LUMA_KEY_MIN_LUMA                y
LUMA_KEY_MAX_LUMA                y
-----------------------------------------------------



I also read about VAAPI, that should be supported for my card. Here some in=
fo:
--------
$ vainfo
vainfo: VA-API version: 1.13 (libva 2.13.0)
vainfo: Driver version: Mesa Gallium driver 21.3.5 for NVA8
vainfo: Supported profile and entrypoints
      VAProfileMPEG2Simple            : VAEntrypointVLD
      VAProfileMPEG2Main              : VAEntrypointVLD
      VAProfileVC1Simple              : VAEntrypointVLD
      VAProfileVC1Main                : VAEntrypointVLD
      VAProfileVC1Advanced            : VAEntrypointVLD
      VAProfileH264ConstrainedBaseline: VAEntrypointVLD
      VAProfileH264Main               : VAEntrypointVLD
      VAProfileH264High               : VAEntrypointVLD
      VAProfileNone                   : VAEntrypointVideoProc
-------------------------------------------------------------

I rebuilt ffmpeg package for adding support to libdav1d for AV1 encoded vid=
eos,
here are the ffmpeg build script for slackware:

https://slackware.uk/slackware/slackware64-15.0/source/l/ffmpeg/ffmpeg.Slac=
kBuild

It is a bit compliacted, but if a library/codec support is needed for hwdec=
, it
will not too hard to find there.
---------------
# mpv --version
mpv 0.34.1 Copyright =C2=A9 2000-2021 mpv/MPlayer/mplayer2 projects
FFmpeg library versions:
   libavutil       56.70.100
   libavcodec      58.134.100
   libavformat     58.76.100
   libswscale      5.9.100
   libavfilter     7.110.100
   libswresample   3.9.100
FFmpeg version: 4.4.1
---------------------


$ mpv -vo=3Dhelp
Available video outputs:
  libmpv           render API for libmpv
  gpu              Shader-based GPU Renderer
  vdpau            VDPAU with X11
  wlshm            Wayland SHM video output (software scaling)
  xv               X11/Xv
  vaapi            VA API with X11
  x11              X11 (software scaling)
  null             Null video output
  image            Write video frames to image files
  tct              true-color terminals
  caca             libcaca
  drm              Direct Rendering Manager (software scaling)
--------------------------------------------------------------


$ mpv -hwdec=3Dhelp
Valid values (with alternative full names):
  vaapi (h263-vaapi)
  vaapi (h263p-vaapi)
  vaapi (h264-vaapi)
  vaapi (hevc-vaapi)
  vaapi (mjpeg-vaapi)
  vaapi (mpeg2video-vaapi)
  vaapi (mpeg4-vaapi)
  vaapi (vc1-vaapi)
  vaapi (vp8-vaapi)
  vaapi (vp9-vaapi)
  vaapi (wmv3-vaapi)
  vaapi (av1-vaapi)
  vdpau (h263-vdpau)
  vdpau (h263p-vdpau)
  vdpau (h264-vdpau)
  vdpau (hevc-vdpau)
  vdpau (mpeg1video-vdpau)
  vdpau (mpeg2video-vdpau)
  vdpau (mpeg4-vdpau)
  vdpau (vc1-vdpau)
  vdpau (vp9-vdpau)
  vdpau (wmv3-vdpau)
  vaapi-copy (h263-vaapi-copy)
  vaapi-copy (h263p-vaapi-copy)
  vaapi-copy (h264-vaapi-copy)
  vaapi-copy (hevc-vaapi-copy)
  vaapi-copy (mjpeg-vaapi-copy)
  vaapi-copy (mpeg2video-vaapi-copy)
  vaapi-copy (mpeg4-vaapi-copy)
  vaapi-copy (vc1-vaapi-copy)
  vaapi-copy (vp8-vaapi-copy)
  vaapi-copy (vp9-vaapi-copy)
  vaapi-copy (wmv3-vaapi-copy)
  vaapi-copy (av1-vaapi-copy)
  vdpau-copy (h263-vdpau-copy)
  vdpau-copy (h263p-vdpau-copy)
  vdpau-copy (h264-vdpau-copy)
  vdpau-copy (hevc-vdpau-copy)
  vdpau-copy (mpeg1video-vdpau-copy)
  vdpau-copy (mpeg2video-vdpau-copy)
  vdpau-copy (mpeg4-vdpau-copy)
  vdpau-copy (vc1-vdpau-copy)
  vdpau-copy (vp9-vdpau-copy)
  vdpau-copy (wmv3-vdpau-copy)
  v4l2m2m-copy (h263_v4l2m2m-v4l2m2m-copy)
  v4l2m2m-copy (h264_v4l2m2m-v4l2m2m-copy)
  v4l2m2m-copy (hevc_v4l2m2m-v4l2m2m-copy)
  v4l2m2m-copy (mpeg4_v4l2m2m-v4l2m2m-copy)
  v4l2m2m-copy (mpeg1_v4l2m2m-v4l2m2m-copy)
  v4l2m2m-copy (mpeg2_v4l2m2m-v4l2m2m-copy)
  v4l2m2m-copy (vc1_v4l2m2m-v4l2m2m-copy)
  v4l2m2m-copy (vp8_v4l2m2m-v4l2m2m-copy)
  v4l2m2m-copy (vp9_v4l2m2m-v4l2m2m-copy)
  auto (yes '')
  no
  auto-safe
  auto-copy
  auto-copy-safe
----------------

$ glxinfo
name of display: :0
display: :0  screen: 0
direct rendering: Yes
----- cut -----------


After trying with some video payback using MPV I noticed following behaviou=
r:

1.
mpv --noconfig -hwdec=3Dvdpau -vo=3Dgpu
works

2.
mpv --noconfig -hwdec=3Dvdpau -vo=3Dvdpau
works

3.
mpv --noconfig -hwdec=3Dvaapi -vo=3Dgpu
doesn't work, colours of the video are corrupted

4.
mpv --noconfig -hwdec=3Dvdpau -vo=3Dvdpau
works

The CPU load seems really low, so good.
But...

But when I touch something, for instance "f" to enlarge to fullscreen,
or "q" to quit MPV...
Surprise!

My system freeze, nothing work again, just the mouse cursor can still
be moved around.
No key combination works: ctrl+alt+F2, ctrl+alt+canc or so on...
And it remains only to switch off by holding power button on the case.

So no, it seems something goes wrong every time I try to use "hwdec".

I also tried with different "pstate" modes, but it doesn't affect the
stability: in any
case hwdec lead to an unstable, and in fact completely locked screen.


I'd like to use open drivers, but I'd like to take advantage of
hardware decoding too, so that my CPU rests as quiet and fresh as
possible. Is there some other suggest to configure some other aspect
and try to achieve my scope?
Or my tests are all I can do?
So for hwdec is better to switch back to closed source nvidia driver
legacy 340.108 ?

Thanks in advance!
