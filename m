Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A0C3405A3
	for <lists+nouveau@lfdr.de>; Thu, 18 Mar 2021 13:39:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE8F26E0D8;
	Thu, 18 Mar 2021 12:39:26 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06A356E09E;
 Thu, 18 Mar 2021 12:39:24 +0000 (UTC)
IronPort-SDR: KFL/cpJQAy5TTEddowIhTKBtACbA/elCU0v6WmHYNCav1xK0CtoG0OkFoKckomiF/ohNLCaBn7
 ChEGaU713X/w==
X-IronPort-AV: E=McAfee;i="6000,8403,9926"; a="176796185"
X-IronPort-AV: E=Sophos;i="5.81,258,1610438400"; d="scan'208";a="176796185"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2021 05:39:23 -0700
IronPort-SDR: 5lnf3Hk57uTi9+5ikVYPWvSgVXwinY/yxtbFNCwxFrV+j7cw+6KIhRX2o/IeDlOCkMd2zVxIy+
 yy1KNP4lLrfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,258,1610438400"; d="scan'208";a="389222851"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga002.jf.intel.com with SMTP; 18 Mar 2021 05:39:20 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 18 Mar 2021 14:39:19 +0200
Date: Thu, 18 Mar 2021 14:39:19 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Martin Peres <martin.peres@mupuf.org>
Message-ID: <YFNJ96fvZpNKtRGv@intel.com>
References: <20210317224520.447939-1-lyude@redhat.com>
 <4793631d-ee46-3d80-aa24-30d18d42e38b@mupuf.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4793631d-ee46-3d80-aa24-30d18d42e38b@mupuf.org>
X-Patchwork-Hint: comment
Subject: Re: [Nouveau] [igt-dev] [PATCH i-g-t] tests/kms_cursor_crc: Test
 32x32 cursors
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
Cc: Petri Latvala <petri.latvala@intel.com>, nouveau@lists.freedesktop.org,
 igt-dev@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, Mar 18, 2021 at 08:39:01AM +0200, Martin Peres wrote:
> On 18/03/2021 00:45, Lyude wrote:
> > From: Lyude Paul <lyude@redhat.com>
> > =

> > Since pre-nve4 only has two cursor sizes (32x32 and 64x64), we should at
> > least test both of them.
> =

> This adds 36 subtests, which take about 1s in average. So the runtime is =

> not significantly increased on the Intel side.
> =

> It also seems that Intel should add skips or fix the kernel to support =

> these 32xXX format.

Intel hw at least does not support 32x32 cursors. We should
probably just just probe the kernel to see if it accepts the
requested cursor size, and skip the subtest if not. That
would also let us remove the i915 platform specific information
from has_nonsquare_cursors().

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
