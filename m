Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF66348B9C
	for <lists+nouveau@lfdr.de>; Thu, 25 Mar 2021 09:34:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1313C6EB73;
	Thu, 25 Mar 2021 08:34:52 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5822E6EB73;
 Thu, 25 Mar 2021 08:34:51 +0000 (UTC)
IronPort-SDR: mmen07RI6kw+P4oDid0duASLwkjQwJQPB6RDZ/JkUstC0Z27hEbsWxvR8wUvldetJJvBb0Vrok
 zwau0YHXUwjQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9933"; a="188584649"
X-IronPort-AV: E=Sophos;i="5.81,277,1610438400"; d="scan'208";a="188584649"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2021 01:34:50 -0700
IronPort-SDR: NsY0foNpAg9aR1Ku5oqYILuOlQVLmG705V5C51vFUxTdQrX37rtUtuPL/oFv2DF+Z1OVXFVgsO
 I0/95Mrv0LzQ==
X-IronPort-AV: E=Sophos;i="5.81,277,1610438400"; d="scan'208";a="443309858"
Received: from thrakatuluk.fi.intel.com (HELO thrakatuluk) ([10.237.68.154])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2021 01:34:49 -0700
Received: from platvala by thrakatuluk with local (Exim 4.94)
 (envelope-from <petri.latvala@intel.com>)
 id 1lPLSn-0000z0-AO; Thu, 25 Mar 2021 10:35:33 +0200
Date: Thu, 25 Mar 2021 10:35:33 +0200
From: Petri Latvala <petri.latvala@intel.com>
To: Lyude Paul <lyude@redhat.com>
Message-ID: <YFxLVbF2lgu5t0LH@platvala-desk.ger.corp.intel.com>
References: <20210317223827.446803-1-lyude@redhat.com>
 <YFMasrshhYVa7daJ@platvala-desk.ger.corp.intel.com>
 <053d072282736247a1f52d907f89cdb430d473b5.camel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <053d072282736247a1f52d907f89cdb430d473b5.camel@redhat.com>
X-Patchwork-Hint: comment
Subject: Re: [Nouveau] [igt-dev] [PATCH i-g-t] lib: Introduce the
 igt_nouveau library
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
Cc: igt-dev@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, Mar 24, 2021 at 06:24:54PM -0400, Lyude Paul wrote:
> On Thu, 2021-03-18 at 11:17 +0200, Petri Latvala wrote:
> > On Wed, Mar 17, 2021 at 06:38:27PM -0400, Lyude wrote:
> > > From: Lyude Paul <lyude@redhat.com>
> > > =

> > > This introduces the igt_nouveau library, which enables support for ti=
ling
> > > formats on nouveau, along with accelerated clears for allocated bos i=
n VRAM
> > > using the dma-copy engine present on Nvidia hardware since Tesla. Typ=
ically
> > > the latter would be handled by the kernel automatically, which is the
> > > long-term plan for nouveau, but since the kernel doesn't yet support =
that
> > > we implement this in igt in order to fulfill the expectation that mos=
t of
> > > igt has in which newly allocated fbs are expected to be zero-filled by
> > > default.
> > > =

> > > The dma-copy engine is capable of fast blitting, and is also able to
> > > perform tiling/untiling at the same time. This is worth mentioning be=
cause
> > > unlike many of the other drivers supported in igt, we go out of our w=
ay to
> > > avoid using mmap() in order to perform CPU rendering wherever possibl=
e.
> > > Instead of mmap()ing an fb that we want to draw to on the CPU (whethe=
r it
> > > be for converting formats, or just normal rendering), we instead use
> > > dma-copy to blit linear/tiled fbs over to linear system memory which =
we
> > > mmap() instead. This is primarily because while mmap() is typically
> > > painfully slow for vram, it's even slower on nouveau due to the curre=
nt
> > > lack of dynamic reclocking in our driver. Furthermore, using the dma-=
copy
> > > engine for copying things over to system ram is also dramatically fas=
ter
> > > than using igt's memcpy wc helpers even when no tiling is involved. S=
uch
> > > speed improvements are both quite nice, but also very necessary for c=
ertain
> > > tests like kms_plane that are rather sensitive when it comes to slow
> > > rendering with drivers.
> > > =

> > > This doesn't mean we won't want to provide a way of using mmap() for
> > > rendering in the future however, as at least basic testing of mmap() =
is
> > > certainly something we eventually want for nouveau. However, I think =
the
> > > best way for us to do this in the future will be to adapt the igt_dra=
w API
> > > to work with nouveau so we can explicitly request using mmap() in tes=
ts
> > > which need it.
> > > =

> > > Finally, this code also adds a hard dependency on libdrm support for
> > > nouveau tests. The main reason for this is currently there are no real
> > > applications that use nouveau's ioctls directly (mesa for instance, u=
ses
> > > libdrm as well) and also that nouveau's ioctls are currently a bit
> > > complicated to use by hand. This will likely be temporary however, as=
 Ben
> > > Skeggs is planning on revamping a lot of nouveau's APIs to simplify t=
hem
> > > and make libdrm support for nouveau obsolete in the future. Note that=
 we
> > > take care to make sure that users can still disable libdrm support for
> > > nouveau if needed, with the only caveat being that any tests using
> > > igt_nouveau will be disabled, along with any tiling support for
> > > nvidia-specific tiling formats.
> > > =

> > > This should enable igt tests which test tiling formats to run on nouv=
eau,
> > > and fix some seemingly random test failures as a result of not having
> > > zero-filled buffers in a few other tests like kms_cursor_crc.
> > > =

> > > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > > Cc: Martin Peres <martin.peres@free.fr>
> > > Cc: Ben Skeggs <bskeggs@redhat.com>
> > > Cc: Jeremy Cline <jcline@redhat.com>
> > > ---
> > > =A0.gitlab-ci.yml=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
|=A0=A0 7 +
> > > =A0include/drm-uapi/drm_fourcc.h=A0=A0 |=A0=A0 2 +-
> > > =A0lib/drmtest.c=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 |=A0=A0 5 +
> > > =A0lib/igt_fb.c=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 |=A0 98 +++++++--
> > > =A0lib/igt_fb.h=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 |=A0=A0 2 +
> > > =A0lib/igt_nouveau.c=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 | 281 =
++++++++++++++++++++++++++
> > > =A0lib/igt_nouveau.h=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0 6=
5 ++++++
> > > =A0lib/meson.build=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=
=A0=A0 8 +
> > > =A0lib/nouveau/cea0b5.c=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 | 252 ++++++=
+++++++++++++++++
> > > =A0lib/nouveau/nvhw/class/cl906f.h | 103 ++++++++++
> > > =A0lib/nouveau/nvhw/class/cla0b5.h | 250 +++++++++++++++++++++++
> > > =A0lib/nouveau/nvhw/drf.h=A0=A0=A0=A0=A0=A0=A0=A0=A0 | 209 ++++++++++=
+++++++++
> > > =A0lib/nouveau/nvif/push.h=A0=A0=A0=A0=A0=A0=A0=A0 | 345 ++++++++++++=
++++++++++++++++++++
> > > =A0lib/nouveau/nvif/push906f.h=A0=A0=A0=A0 |=A0 70 +++++++
> > > =A0lib/nouveau/priv.h=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0 57 =
++++++
> > > =A0meson.build=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 |=A0=A0 3 +
> > > =A0tests/meson.build=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=
=A0 2 +-
> > > =A017 files changed, 1745 insertions(+), 14 deletions(-)
> > > =A0create mode 100644 lib/igt_nouveau.c
> > > =A0create mode 100644 lib/igt_nouveau.h
> > > =A0create mode 100644 lib/nouveau/cea0b5.c
> > > =A0create mode 100644 lib/nouveau/nvhw/class/cl906f.h
> > > =A0create mode 100644 lib/nouveau/nvhw/class/cla0b5.h
> > > =A0create mode 100644 lib/nouveau/nvhw/drf.h
> > > =A0create mode 100644 lib/nouveau/nvif/push.h
> > > =A0create mode 100644 lib/nouveau/nvif/push906f.h
> > > =A0create mode 100644 lib/nouveau/priv.h
> > =

> > Do you want to support autotools?
> =

> nope :P. I can if it's needed, but otherwise I'm totally fine with this b=
eing a
> meson-only feature


Ah yes! Our "does this also build with autotools" check already
ignores tests that match the string "nouveau"...


-- =

Petri Latvala
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
