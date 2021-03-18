Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF24340194
	for <lists+nouveau@lfdr.de>; Thu, 18 Mar 2021 10:14:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA9D96E8A7;
	Thu, 18 Mar 2021 09:14:33 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C3BE6E8A7;
 Thu, 18 Mar 2021 09:14:32 +0000 (UTC)
IronPort-SDR: 8/LCV4ICIJygJWhApMcz1cMgpcgrjna8uiw1Rc5utwmH8K7AMIJ6Mu9RztvI8kQckZFutUEH5M
 ZtDSanDl3d6Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9926"; a="189009697"
X-IronPort-AV: E=Sophos;i="5.81,258,1610438400"; d="scan'208";a="189009697"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2021 02:14:31 -0700
IronPort-SDR: 9L4aoaOZCeUfTV1/u1TEzfj/L6fGDofscLCa/A6sZA1KFtyo0lh2bRnMLhd9BOfTqn5SuKmADs
 GzmvVndEv1eg==
X-IronPort-AV: E=Sophos;i="5.81,258,1610438400"; d="scan'208";a="440826688"
Received: from thrakatuluk.fi.intel.com (HELO thrakatuluk) ([10.237.68.154])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2021 02:14:30 -0700
Received: from platvala by thrakatuluk with local (Exim 4.94)
 (envelope-from <petri.latvala@intel.com>)
 id 1lMokF-0001lC-I2; Thu, 18 Mar 2021 11:15:07 +0200
Date: Thu, 18 Mar 2021 11:15:07 +0200
From: Petri Latvala <petri.latvala@intel.com>
To: Martin Peres <martin.peres@mupuf.org>
Message-ID: <YFMaG3tRgsiizy+J@platvala-desk.ger.corp.intel.com>
References: <20210317223827.446803-1-lyude@redhat.com>
 <f42f3af7-658e-b06f-fb79-c36273ac4810@mupuf.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f42f3af7-658e-b06f-fb79-c36273ac4810@mupuf.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, Mar 18, 2021 at 09:06:29AM +0200, Martin Peres wrote:
> On 18/03/2021 00:38, Lyude wrote:
> > diff --git a/include/drm-uapi/drm_fourcc.h b/include/drm-uapi/drm_fourcc.h
> > index a7bc058c..87c87485 100644
> > --- a/include/drm-uapi/drm_fourcc.h
> > +++ b/include/drm-uapi/drm_fourcc.h
> > @@ -681,7 +681,7 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
> >   }
> >   /*
> > - * 16Bx2 Block Linear layout, used by Tegra K1 and later
> > + * 16Bx2 Block Linear layout, used by desktop GPUs, and Tegra K1 and later
> 
> Maybe remove one of the "and"s?
> 
> 16Bx2 Block Linear layout, used by desktop GPUs, and Tegra K1+

drm_fourcc.h is copied from the kernel, no hand-editing in IGT.


-- 
Petri Latvala
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
