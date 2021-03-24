Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 368C8347D5A
	for <lists+nouveau@lfdr.de>; Wed, 24 Mar 2021 17:12:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 560EB6EA3F;
	Wed, 24 Mar 2021 16:12:54 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3E7B6EA3D;
 Wed, 24 Mar 2021 16:12:52 +0000 (UTC)
IronPort-SDR: C6Y494+Ru04bnqi+Ftal62qaOLpSj/Jgg5ymvIu6MpdVKyZ6aseVZBbGlUtuJxoQT8JxehmAw7
 rkA3xvcOiMvA==
X-IronPort-AV: E=McAfee;i="6000,8403,9933"; a="177855049"
X-IronPort-AV: E=Sophos;i="5.81,275,1610438400"; d="scan'208";a="177855049"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2021 09:12:52 -0700
IronPort-SDR: q11BGvcztc/T1yP4/mYtWqC1z/t0ZZQ7mmUPU/6lXIMPCNFxKEZtcMt+YY+VpRdfitYhvEum4W
 Cxh2zjFTidSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,275,1610438400"; d="scan'208";a="442299793"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga002.fm.intel.com with SMTP; 24 Mar 2021 09:12:49 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 24 Mar 2021 18:12:48 +0200
Date: Wed, 24 Mar 2021 18:12:48 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Lyude <lyude@redhat.com>
Message-ID: <YFtlAL+YxOc/dN4H@intel.com>
References: <20210318222124.970997-2-lyude@redhat.com>
 <20210323172513.1519481-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210323172513.1519481-1-lyude@redhat.com>
X-Patchwork-Hint: comment
Subject: Re: [Nouveau] [igt-dev] [PATCH i-g-t v3] tests/kms_cursor_crc:
 Probe kernel for cursor size support
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

On Tue, Mar 23, 2021 at 01:25:13PM -0400, Lyude wrote:
> From: Lyude Paul <lyude@redhat.com>
> =

> Currently we just assume that every cursor size up to data->cursor_max_w/=
h will
> be supported by the driver, and check for support of nonsquare cursors by
> checking if we're running on u815 and if so, which variant of intel hardw=
are
> we're running on. This isn't really ideal as we're about to enable 32x32 =
cursor
> size tests for nouveau, and Intel hardware doesn't support cursor sizes t=
hat
> small.
> =

> So, fix this by removing has_nonsquare_cursors() and replacing it with a =
more
> generic require_cursor_size() function which checks whether or not the dr=
iver
> we're using supports a given cursor size by attempting a test-only atomic
> commit.
> =

> v3:
> * Also probe for cursor support on systems without atomic support

Gave this a go on my i865, and after removing a bogus max_w=3D=3Dmax_h
assert it all passed, and your non-square probing worked fine.
I'll need to send a patch to nuke that bogus assert, and I also had
an idea to test the max sized cursor as well (in case it's not square
and thus not being tested already)...

with the s/u815/i915/ Petri pointed out
Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
