Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D3E3417ED
	for <lists+nouveau@lfdr.de>; Fri, 19 Mar 2021 10:04:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A74DA6E9AD;
	Fri, 19 Mar 2021 09:04:43 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 299396E9AD;
 Fri, 19 Mar 2021 09:04:42 +0000 (UTC)
IronPort-SDR: BEyyCSzckN5+N9qS7B3zyeCv1FcDkKLh3NuMRR9JleYQP+zZITwKUNfQPnO+nhjM4sBqwQAvZl
 cHV7kSQ8ZMGA==
X-IronPort-AV: E=McAfee;i="6000,8403,9927"; a="177445265"
X-IronPort-AV: E=Sophos;i="5.81,261,1610438400"; d="scan'208";a="177445265"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2021 02:04:41 -0700
IronPort-SDR: D35LQJhT/k11HbNnUMIUFudTaqNXPGtVUniZba/4oMrVYkYlxd2aFklQD7SoqXjgkIDC2vJ07f
 gAXNtJ56sXqg==
X-IronPort-AV: E=Sophos;i="5.81,261,1610438400"; d="scan'208";a="450801506"
Received: from thrakatuluk.fi.intel.com (HELO thrakatuluk) ([10.237.68.154])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2021 02:04:39 -0700
Received: from platvala by thrakatuluk with local (Exim 4.94)
 (envelope-from <petri.latvala@intel.com>)
 id 1lNB4H-0003dy-8u; Fri, 19 Mar 2021 11:05:17 +0200
Date: Fri, 19 Mar 2021 11:05:17 +0200
From: Petri Latvala <petri.latvala@intel.com>
To: Lyude Paul <lyude@redhat.com>
Message-ID: <YFRpTVxr8Kso/7ky@platvala-desk.ger.corp.intel.com>
References: <20210317223827.446803-1-lyude@redhat.com>
 <f42f3af7-658e-b06f-fb79-c36273ac4810@mupuf.org>
 <YFMaG3tRgsiizy+J@platvala-desk.ger.corp.intel.com>
 <3c5108990850ae8f88952c3149eaa935f7e378e7.camel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3c5108990850ae8f88952c3149eaa935f7e378e7.camel@redhat.com>
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
 Ben Skeggs <bskeggs@redhat.com>, Martin Peres <martin.peres@mupuf.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, Mar 18, 2021 at 12:49:13PM -0400, Lyude Paul wrote:
> On Thu, 2021-03-18 at 11:15 +0200, Petri Latvala wrote:
> > On Thu, Mar 18, 2021 at 09:06:29AM +0200, Martin Peres wrote:
> > > On 18/03/2021 00:38, Lyude wrote:
> > > > diff --git a/include/drm-uapi/drm_fourcc.h b/include/drm-uapi/drm_f=
ourcc.h
> > > > index a7bc058c..87c87485 100644
> > > > --- a/include/drm-uapi/drm_fourcc.h
> > > > +++ b/include/drm-uapi/drm_fourcc.h
> > > > @@ -681,7 +681,7 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64
> > > > modifier)
> > > > =A0 }
> > > > =A0 /*
> > > > - * 16Bx2 Block Linear layout, used by Tegra K1 and later
> > > > + * 16Bx2 Block Linear layout, used by desktop GPUs, and Tegra K1 a=
nd
> > > > later
> > > =

> > > Maybe remove one of the "and"s?
> > > =

> > > 16Bx2 Block Linear layout, used by desktop GPUs, and Tegra K1+
> > =

> > drm_fourcc.h is copied from the kernel, no hand-editing in IGT.
> =

> These additions are all copied from the drm_fourcc.h file in the kernel t=
hough,
> do you want me to just update the whole file instead?

It was more of a response to Martin's suggestion that would need to go
through the kernel.

As for this patch to IGT, yes please, copy the file from the kernel
as-is. As a separate commit, commit message stating which SHA in
kernel it's from.


-- =

Petri Latvala



> =

> > =

> > =

> =

> -- =

> Sincerely,
>    Lyude Paul (she/her)
>    Software Engineer at Red Hat
>    =

> Note: I deal with a lot of emails and have a lot of bugs on my plate. If =
you've
> asked me a question, are waiting for a review/merge on a patch, etc. and I
> haven't responded in a while, please feel free to send me another email t=
o check
> on my status. I don't bite!
> =

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
