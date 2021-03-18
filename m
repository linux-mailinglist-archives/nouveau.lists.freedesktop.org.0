Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 924B4340217
	for <lists+nouveau@lfdr.de>; Thu, 18 Mar 2021 10:32:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D75D96E8B6;
	Thu, 18 Mar 2021 09:32:19 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFFD26E8B6;
 Thu, 18 Mar 2021 09:32:18 +0000 (UTC)
IronPort-SDR: jhGVQG9IimXlDdiWKZMZxEbEdwA4v0MQ1ZwxxNmjn6xxQ9xGECLIdZVOiUHr8C6bcU5dPE+05g
 A3psOGL5nb0Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9926"; a="253651100"
X-IronPort-AV: E=Sophos;i="5.81,258,1610438400"; d="scan'208";a="253651100"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2021 02:32:18 -0700
IronPort-SDR: 5wOw0vHhyD07ij9hRqAUMaqD30S2wRdhY34ffLIumte3DIeEtQab4F9ll29my9aBuV0H2H4nmO
 YLwJXd+y81hg==
X-IronPort-AV: E=Sophos;i="5.81,258,1610438400"; d="scan'208";a="450419673"
Received: from thrakatuluk.fi.intel.com (HELO thrakatuluk) ([10.237.68.154])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2021 02:32:16 -0700
Received: from platvala by thrakatuluk with local (Exim 4.94)
 (envelope-from <petri.latvala@intel.com>)
 id 1lMp1S-0001qy-0b; Thu, 18 Mar 2021 11:32:54 +0200
Date: Thu, 18 Mar 2021 11:32:54 +0200
From: Petri Latvala <petri.latvala@intel.com>
To: Lyude <lyude@redhat.com>
Message-ID: <YFMeRtiiVQsN8pBC@platvala-desk.ger.corp.intel.com>
References: <20210317224949.448284-1-lyude@redhat.com>
 <20210317224949.448284-2-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210317224949.448284-2-lyude@redhat.com>
X-Patchwork-Hint: comment
Subject: Re: [Nouveau] [igt-dev] [PATCH i-g-t 1/7] lib/drmtest: Use
 igt_assert_eq() for do_or_die()
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

On Wed, Mar 17, 2021 at 06:49:43PM -0400, Lyude wrote:
> From: Lyude Paul <lyude@redhat.com>
> 
> Noticed this while working on some nouveau tests, if we use igt_assert_eq()
> here we'll output both the expected and returned value instead of just the
> expected value.

igt_assert_eq stuffs x into an int so there's one difference.

Hmm, but generally do_or_die is used with ioctl() or something that
wraps it and it will be an int.


> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Cc: Martin Peres <martin.peres@free.fr>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Jeremy Cline <jcline@redhat.com>
> ---
>  lib/drmtest.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/drmtest.h b/lib/drmtest.h
> index d393dbf1..789452ea 100644
> --- a/lib/drmtest.h
> +++ b/lib/drmtest.h
> @@ -113,7 +113,7 @@ bool is_vc4_device(int fd);
>   * that in any failure case the return value is non-zero and a precise error is
>   * logged into errno. Uses igt_assert() internally.

A minor cosmetic change to this comment (igt_assert usage) is welcome.



Reviewed-by: Petri Latvala <petri.latvala@intel.com>


>   */
> -#define do_or_die(x) igt_assert((x) == 0)
> +#define do_or_die(x) igt_assert_eq((x), 0)
>  
>  /**
>   * do_ioctl:
> -- 
> 2.29.2
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
