Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 558F8340009
	for <lists+nouveau@lfdr.de>; Thu, 18 Mar 2021 08:08:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF6226E893;
	Thu, 18 Mar 2021 07:08:46 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from aibo.runbox.com (aibo.runbox.com [91.220.196.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 566716E093
 for <nouveau@lists.freedesktop.org>; Thu, 18 Mar 2021 07:02:51 +0000 (UTC)
Received: from [10.9.9.74] (helo=submission03.runbox)
 by mailtransmit02.runbox with esmtp (Exim 4.86_2)
 (envelope-from <martin.peres@mupuf.org>)
 id 1lMmMd-0007Vy-Am; Thu, 18 Mar 2021 07:42:35 +0100
Received: by submission03.runbox with esmtpsa [Authenticated alias (981869)]
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.90_1)
 id 1lMmMW-0001W2-59; Thu, 18 Mar 2021 07:42:28 +0100
To: Lyude <lyude@redhat.com>, igt-dev@lists.freedesktop.org
References: <20210317224222.447100-1-lyude@redhat.com>
From: Martin Peres <martin.peres@mupuf.org>
Message-ID: <2bcaa3ba-7bf4-3f39-df09-ea6f8c0e12cd@mupuf.org>
Date: Thu, 18 Mar 2021 08:42:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210317224222.447100-1-lyude@redhat.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 18 Mar 2021 07:08:45 +0000
Subject: Re: [Nouveau] [igt-dev] [PATCH i-g-t 0/3] tests/kms_color: Fixup
 for nouveau
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
Cc: nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 18/03/2021 00:42, Lyude wrote:
> From: Lyude Paul <lyude@redhat.com>
> 
> This patch series just introduces a small drive-by cleanup for
> kms_color, and fixes the kms_color test so that it works correctly on
> nouveau. Note that the invalid LUT/gamma tests will likely currently
> fail, but I'm going to be submitting some kernel patches to fix these in
> nouveau very shortly.

The series is:

Reviewed-by: Martin Peres <martin.peres@mupuf.org>

> 
> Cc: Martin Peres <martin.peres@free.fr>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Jeremy Cline <jcline@redhat.com>
> 
> Lyude Paul (3):
>    tests/kms_color: Don't opencode igt_check_crc_equal()
>    tests/kms_color: Allow tests to run on any driver
>    tests/kms_color: Stop leaking fbs
> 
>   tests/kms_color.c        | 15 +++++++++++++--
>   tests/kms_color_helper.c |  6 ------
>   2 files changed, 13 insertions(+), 8 deletions(-)
> 
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
