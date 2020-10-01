Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E9727F9A6
	for <lists+nouveau@lfdr.de>; Thu,  1 Oct 2020 08:50:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 975F86E141;
	Thu,  1 Oct 2020 06:50:07 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 859416E141;
 Thu,  1 Oct 2020 06:50:06 +0000 (UTC)
IronPort-SDR: EW8KO9ZcDMN2XVyIWMM3fE3fCM7kSgpjGhiYHFgwD/0gfQu65Auj27kiVQ1PU3GIQWk9PYUeIV
 cyvz4j8hYuZQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9760"; a="163510493"
X-IronPort-AV: E=Sophos;i="5.77,323,1596524400"; d="scan'208";a="163510493"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2020 23:50:04 -0700
IronPort-SDR: gyPhCp5iBlt7Dxvdk28N2JvewNY5hl1OW6FJK3q6gvAj1L6HCTJidNK9dcuhU4RaujoWfMjoiq
 QR436YHbYkfQ==
X-IronPort-AV: E=Sophos;i="5.77,323,1596524400"; d="scan'208";a="351844325"
Received: from thrakatuluk.fi.intel.com (HELO thrakatuluk) ([10.237.68.154])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2020 23:50:03 -0700
Received: from platvala by thrakatuluk with local (Exim 4.92)
 (envelope-from <petri.latvala@intel.com>)
 id 1kNsPh-0004jJ-8l; Thu, 01 Oct 2020 09:50:01 +0300
Date: Thu, 1 Oct 2020 09:50:01 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Lyude <lyude@redhat.com>
Message-ID: <20201001065001.GB7444@platvala-desk.ger.corp.intel.com>
References: <20200930173150.431995-1-lyude@redhat.com>
 <20200930173150.431995-3-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200930173150.431995-3-lyude@redhat.com>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Nouveau] [igt-dev] [PATCH i-g-t v5 2/5] lib/igt_core: Add
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

On Wed, Sep 30, 2020 at 01:31:47PM -0400, Lyude wrote:
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
> index e74ede8b..5d835260 100644
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
