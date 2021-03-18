Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D23340005
	for <lists+nouveau@lfdr.de>; Thu, 18 Mar 2021 08:08:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E1D06E09A;
	Thu, 18 Mar 2021 07:08:46 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from aibo.runbox.com (aibo.runbox.com [91.220.196.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 885526E88C
 for <nouveau@lists.freedesktop.org>; Thu, 18 Mar 2021 07:05:53 +0000 (UTC)
Received: from [10.9.9.74] (helo=submission03.runbox)
 by mailtransmit03.runbox with esmtp (Exim 4.86_2)
 (envelope-from <martin.peres@mupuf.org>)
 id 1lMmJP-00010p-AU; Thu, 18 Mar 2021 07:39:15 +0100
Received: by submission03.runbox with esmtpsa [Authenticated alias (981869)]
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.90_1)
 id 1lMmJB-0001Af-F9; Thu, 18 Mar 2021 07:39:01 +0100
To: Lyude <lyude@redhat.com>, igt-dev@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>
References: <20210317224520.447939-1-lyude@redhat.com>
From: Martin Peres <martin.peres@mupuf.org>
Message-ID: <4793631d-ee46-3d80-aa24-30d18d42e38b@mupuf.org>
Date: Thu, 18 Mar 2021 08:39:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210317224520.447939-1-lyude@redhat.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 18 Mar 2021 07:08:45 +0000
Subject: Re: [Nouveau] [igt-dev] [PATCH i-g-t] tests/kms_cursor_crc: Test
 32x32 cursors
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
Cc: Ben Skeggs <bskeggs@redhat.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 18/03/2021 00:45, Lyude wrote:
> From: Lyude Paul <lyude@redhat.com>
> 
> Since pre-nve4 only has two cursor sizes (32x32 and 64x64), we should at
> least test both of them.

This adds 36 subtests, which take about 1s in average. So the runtime is 
not significantly increased on the Intel side.

It also seems that Intel should add skips or fix the kernel to support 
these 32xXX format.

@Petri, could you get someone to investigate this?

In the mean time, here is my:

Reviewed-by: Martin Peres <martin.peres@mupuf.org>

Martin
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Cc: Martin Peres <martin.peres@free.fr>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Jeremy Cline <jcline@redhat.com>
> ---
>   tests/kms_cursor_crc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
> index 0be8f7f8..c70c4a8f 100644
> --- a/tests/kms_cursor_crc.c
> +++ b/tests/kms_cursor_crc.c
> @@ -683,7 +683,7 @@ static void run_tests_on_pipe(data_t *data, enum pipe pipe)
>   	igt_fixture
>   		igt_remove_fb(data->drm_fd, &data->fb);
>   
> -	for (cursor_size = 64; cursor_size <= 512; cursor_size *= 2) {
> +	for (cursor_size = 32; cursor_size <= 512; cursor_size *= 2) {
>   		int w = cursor_size;
>   		int h = cursor_size;
>   
> 
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
