Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B85BA340007
	for <lists+nouveau@lfdr.de>; Thu, 18 Mar 2021 08:08:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90E846E88F;
	Thu, 18 Mar 2021 07:08:46 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 546 seconds by postgrey-1.36 at gabe;
 Thu, 18 Mar 2021 06:48:33 UTC
Received: from aibo.runbox.com (aibo.runbox.com [91.220.196.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15C5D6E558;
 Thu, 18 Mar 2021 06:48:33 +0000 (UTC)
Received: from [10.9.9.73] (helo=submission02.runbox)
 by mailtransmit03.runbox with esmtp (Exim 4.86_2)
 (envelope-from <martin.peres@mupuf.org>)
 id 1lMmSL-0001kL-Di; Thu, 18 Mar 2021 07:48:29 +0100
Received: by submission02.runbox with esmtpsa [Authenticated alias (981869)]
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.90_1)
 id 1lMmSD-0007s6-Bf; Thu, 18 Mar 2021 07:48:21 +0100
To: Lyude <lyude@redhat.com>, nouveau@lists.freedesktop.org,
 igt-dev@lists.freedesktop.org
References: <20210317224949.448284-1-lyude@redhat.com>
From: Martin Peres <martin.peres@mupuf.org>
Message-ID: <7995a772-c57d-afeb-aa7b-df6f729a3777@mupuf.org>
Date: Thu, 18 Mar 2021 08:48:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210317224949.448284-1-lyude@redhat.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 18 Mar 2021 07:08:45 +0000
Subject: Re: [Nouveau] [igt-dev] [PATCH i-g-t 0/7] lib: Miscellaneous
 cleanups from nouveau work
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 18/03/2021 00:49, Lyude wrote:
> From: Lyude Paul <lyude@redhat.com>
> 
> These are just a couple of small fixes that didn't seem important
> enough to stick in their own patch series, but were various issues with
> igt that I found along the way during my recent nouveau igt work.
> 
> Cc: Martin Peres <martin.peres@free.fr>
> Cc: Jeremy Cline <jcline@redhat.com>

This series looks sensible to me, and do not seem to have affected 
Intel's results.

I'll refrain from giving a full R-b because I lack the historical 
context for some of these changes, but it seems safe to me:

Acked-by: Martin Peres <martin.peres@mupuf.org>

> 
> Lyude Paul (7):
>    lib/drmtest: Use igt_assert_eq() for do_or_die()
>    lib/drmtest: And use do_or_die() in do_ioctl()
>    lib/drmtest: Remove i915 refs in do_ioctl*() docs
>    lib/igt_fb: Remove domain from igt_fb
>    lib/debugfs: Fix igt_crc_t docs to mention has_valid_frame
>    lib/igt_aux: Print name of debug var in igt_debug_wait_for_keypress()
>    lib/debugfs: Fix function name in igt_pipe_crc_get_for_frame() docs
> 
>   lib/drmtest.h     | 8 ++++----
>   lib/igt_aux.c     | 2 +-
>   lib/igt_debugfs.c | 2 +-
>   lib/igt_debugfs.h | 3 ++-
>   lib/igt_fb.c      | 3 ---
>   lib/igt_fb.h      | 2 --
>   6 files changed, 8 insertions(+), 12 deletions(-)
> 
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
