Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A501B05AA
	for <lists+nouveau@lfdr.de>; Mon, 20 Apr 2020 11:30:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C7056E49F;
	Mon, 20 Apr 2020 09:30:00 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DDF26E49B;
 Mon, 20 Apr 2020 09:29:58 +0000 (UTC)
IronPort-SDR: tWXh+8U4apE4OYdET+QftwzpbrwPucMSS5Uez4AM5U/qObO28JcbVq/1GREV3SOD70ie5Dvbwe
 +cM4OpEJTgVw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2020 02:29:57 -0700
IronPort-SDR: H+A5gk2s8+YErp09kCUYEKDhHK56klRVJHvigzlps9Kwuo6wc3MDqxeJRXFuAdBwgFzshKJBUC
 nF/3uU/vhr4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,406,1580803200"; d="scan'208";a="243753086"
Received: from thrakatuluk.fi.intel.com (HELO thrakatuluk) ([10.237.68.154])
 by orsmga007.jf.intel.com with ESMTP; 20 Apr 2020 02:29:56 -0700
Received: from platvala by thrakatuluk with local (Exim 4.92)
 (envelope-from <petri.latvala@intel.com>)
 id 1jQSkV-0001Q2-PK; Mon, 20 Apr 2020 12:29:55 +0300
Date: Mon, 20 Apr 2020 12:29:55 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Lyude <lyude@redhat.com>
Message-ID: <20200420092955.GX9497@platvala-desk.ger.corp.intel.com>
References: <20200417211025.109574-1-lyude@redhat.com>
 <20200417211025.109574-3-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200417211025.109574-3-lyude@redhat.com>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Nouveau] [igt-dev] [PATCH i-g-t v3 2/5] lib/igt_core: Add
 igt_require_fd()
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

On Fri, Apr 17, 2020 at 05:10:22PM -0400, Lyude wrote:
> From: Lyude Paul <lyude@redhat.com>
> 
> Like igt_assert_fd(), but using igt_require() instead
> 
> Changes since v1:
> * Fix documentation error in igt_require_fd() - Petri Latvala
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>


Reviewed-by: Petri Latvala <petri.latvala@intel.com>



> ---
>  lib/igt_core.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/lib/igt_core.h b/lib/igt_core.h
> index 3f69b072..8f68b2dd 100644
> --- a/lib/igt_core.h
> +++ b/lib/igt_core.h
> @@ -1021,6 +1021,18 @@ void igt_describe_f(const char *fmt, ...);
>  	else igt_debug("Test requirement passed: %s\n", #expr); \
>  } while (0)
>  
> +/**
> + * igt_require_fd:
> + * @fd: file descriptor
> + *
> + * Skips (sub-) test if the given file descriptor is invalid.
> + *
> + * Like igt_require(), but displays the stringified identifier that was supposed
> + * to contain a valid fd on failure.
> + */
> +#define igt_require_fd(fd) \
> +	igt_require_f(fd >= 0, "file descriptor " #fd " failed\n");
> +
>  /**
>   * igt_skip_on_f:
>   * @expr: condition to test
> -- 
> 2.25.1
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
