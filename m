Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1151B05A2
	for <lists+nouveau@lfdr.de>; Mon, 20 Apr 2020 11:29:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 419006E49D;
	Mon, 20 Apr 2020 09:29:16 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31E556E49B;
 Mon, 20 Apr 2020 09:29:14 +0000 (UTC)
IronPort-SDR: BFp+uFVttAoN77S+PQsW1dxYUKsQvsbG+o0NOOryKsmyflpfWd+pn7o1VeZOdmjQZ9daL1P4nG
 I5nXZKbM0iAw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2020 02:29:13 -0700
IronPort-SDR: 6hAd0d/hQbCUc7vu8tJVjnJRkRXtze88Z1nNsKrrMKiExU2jJW8H/QGBbUfO1EGunwRba9XJIy
 gh+AD/ZQOXCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,406,1580803200"; d="scan'208";a="455636108"
Received: from thrakatuluk.fi.intel.com (HELO thrakatuluk) ([10.237.68.154])
 by fmsmga005.fm.intel.com with ESMTP; 20 Apr 2020 02:29:11 -0700
Received: from platvala by thrakatuluk with local (Exim 4.92)
 (envelope-from <petri.latvala@intel.com>)
 id 1jQSjm-0001Pn-ML; Mon, 20 Apr 2020 12:29:10 +0300
Date: Mon, 20 Apr 2020 12:29:10 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Lyude <lyude@redhat.com>
Message-ID: <20200420092910.GW9497@platvala-desk.ger.corp.intel.com>
References: <20200417211025.109574-1-lyude@redhat.com>
 <20200417211025.109574-2-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200417211025.109574-2-lyude@redhat.com>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Nouveau] [igt-dev] [PATCH i-g-t v3 1/5] lib/igt_core: Fix
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

On Fri, Apr 17, 2020 at 05:10:21PM -0400, Lyude wrote:
> From: Lyude Paul <lyude@redhat.com>
> 
> As Petri Latvala pointed out, some of the documentation in this macro is
> mistakenly copied from the other igt_assert*() macros. Let's fix that.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  lib/igt_core.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/igt_core.h b/lib/igt_core.h
> index b97fa2fa..3f69b072 100644
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


For some values of "like" this is like igt_assert, but for some it's
not. I don't have enough coffee to suggest a better wording though.


Reviewed-by: Petri Latvala <petri.latvala@intel.com>


>   */
>  #define igt_assert_fd(fd) \
>  	igt_assert_f(fd >= 0, "file descriptor " #fd " failed\n");
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
