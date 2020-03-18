Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1704A197580
	for <lists+nouveau@lfdr.de>; Mon, 30 Mar 2020 09:22:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB9536E0E9;
	Mon, 30 Mar 2020 07:22:22 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 020C56E879;
 Wed, 18 Mar 2020 08:12:21 +0000 (UTC)
IronPort-SDR: x9fQ4B5AJ73/ZNLMatPACkqAMjm/cF1Z9LeBfU55r/wQck+f1H4pq9238GQj66CMSjn2zak1fq
 fPo+DyC517Mw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2020 01:12:21 -0700
IronPort-SDR: kBtp3+I86ch7P/CuRVrzlg5gi2N9YIPVYG/q76Pw9jcLWKckeybToVhNtySlI5m6OxaauO2COn
 YBDdlJYyIszQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,566,1574150400"; d="scan'208";a="417864512"
Received: from thrakatuluk.fi.intel.com (HELO thrakatuluk) ([10.237.68.154])
 by orsmga005.jf.intel.com with ESMTP; 18 Mar 2020 01:12:19 -0700
Received: from platvala by thrakatuluk with local (Exim 4.92)
 (envelope-from <petri.latvala@intel.com>)
 id 1jEToI-0007FD-Pn; Wed, 18 Mar 2020 10:12:18 +0200
Date: Wed, 18 Mar 2020 10:12:18 +0200
From: Petri Latvala <petri.latvala@intel.com>
To: Lyude <lyude@redhat.com>
Message-ID: <20200318081218.GI9497@platvala-desk.ger.corp.intel.com>
References: <20200318010047.237024-1-lyude@redhat.com>
 <20200318010047.237024-2-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200318010047.237024-2-lyude@redhat.com>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Mon, 30 Mar 2020 07:22:22 +0000
Subject: Re: [Nouveau] [igt-dev] [PATCH i-g-t 1/4] lib/igt_core: Add
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

On Tue, Mar 17, 2020 at 09:00:44PM -0400, Lyude wrote:
> From: Lyude Paul <lyude@redhat.com>
> 
> Like igt_assert_fd(), but using igt_require() instead
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  lib/igt_core.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/lib/igt_core.h b/lib/igt_core.h
> index fae5f59e..b66336cf 100644
> --- a/lib/igt_core.h
> +++ b/lib/igt_core.h
> @@ -1008,6 +1008,18 @@ void igt_describe_f(const char *fmt, ...);
>  	else igt_debug("Test requirement passed: %s\n", #expr); \
>  } while (0)
>  
> +/**
> + * igt_require_fd:
> + * @fd: file descriptor
> + *
> + * Skips (sub-) test if the given file descriptor is invalid.
> + *
> + * Like igt_require(), but displays the values being compared on failure instead
> + * of simply printing the stringified expression..

igt_assert_fd has this documentation comment, but that's mistakenly
copypasted from igt_assert_eq and pals. Let's not propagate the
copypaste error further.


-- 
Petri Latvala


> + */
> +#define igt_require_fd(fd) \
> +	igt_require_f(fd >= 0, "file descriptor " #fd " failed\n");
> +
>  /**
>   * igt_skip_on_f:
>   * @expr: condition to test
> -- 
> 2.24.1
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
