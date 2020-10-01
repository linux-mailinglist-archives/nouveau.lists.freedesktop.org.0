Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE8C27F9A2
	for <lists+nouveau@lfdr.de>; Thu,  1 Oct 2020 08:49:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FE8189C6C;
	Thu,  1 Oct 2020 06:49:34 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D1AC89C6C;
 Thu,  1 Oct 2020 06:49:33 +0000 (UTC)
IronPort-SDR: DgQoDskMddrQsUmdYHBTFxqcBrIkWIeQIdgSIgmDErS6kfnmPKhYaQZIG8RCMNRiOzkwzpOkK4
 z8LBsGkgD8jA==
X-IronPort-AV: E=McAfee;i="6000,8403,9760"; a="180805047"
X-IronPort-AV: E=Sophos;i="5.77,323,1596524400"; d="scan'208";a="180805047"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2020 23:49:30 -0700
IronPort-SDR: DJ+tUbobLZ0hmtcQX54QyJuUxeW9MGANFykneWUf0ea/vfudK8YmYiUpvwPrwht/F1QJhF+SWd
 DaRQcDJ98ITQ==
X-IronPort-AV: E=Sophos;i="5.77,323,1596524400"; d="scan'208";a="514570516"
Received: from thrakatuluk.fi.intel.com (HELO thrakatuluk) ([10.237.68.154])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2020 23:49:29 -0700
Received: from platvala by thrakatuluk with local (Exim 4.92)
 (envelope-from <petri.latvala@intel.com>)
 id 1kNsP8-0004iy-U7; Thu, 01 Oct 2020 09:49:26 +0300
Date: Thu, 1 Oct 2020 09:49:26 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Lyude <lyude@redhat.com>
Message-ID: <20201001064926.GA7444@platvala-desk.ger.corp.intel.com>
References: <20200930173150.431995-1-lyude@redhat.com>
 <20200930173150.431995-2-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200930173150.431995-2-lyude@redhat.com>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Nouveau] [igt-dev] [PATCH i-g-t v5 1/5] lib/igt_core: Fix
 igt_assert_fd() documentation
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
Cc: igt-dev@lists.freedesktop.org, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, Sep 30, 2020 at 01:31:46PM -0400, Lyude wrote:
> From: Lyude Paul <lyude@redhat.com>
> 
> As Petri Latvala pointed out, some of the documentation in this macro is
> mistakenly copied from the other igt_assert*() macros. Let's fix that.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>

Reviewed-by: Petri Latvala <petri.latvala@intel.com>


> ---
>  lib/igt_core.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/igt_core.h b/lib/igt_core.h
> index c5871520..e74ede8b 100644
> --- a/lib/igt_core.h
> +++ b/lib/igt_core.h
> @@ -966,8 +966,8 @@ void igt_describe_f(const char *fmt, ...);
>   *
>   * Fails (sub-) test if the given file descriptor is invalid.
>   *
> - * Like igt_assert(), but displays the values being compared on failure instead
> - * of simply printing the stringified expression.
> + * Like igt_assert(), but displays the stringified identifier that was supposed
> + * to contain a valid fd on failure.
>   */
>  #define igt_assert_fd(fd) \
>  	igt_assert_f(fd >= 0, "file descriptor " #fd " failed\n");
> -- 
> 2.26.2
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
