Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA615CF6DCC
	for <lists+nouveau@lfdr.de>; Tue, 06 Jan 2026 07:16:03 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BD0CE10E48E;
	Tue,  6 Jan 2026 06:16:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=embeddedor.com header.i=@embeddedor.com header.b="pUw0IcUm";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2B55A44C9B;
	Tue,  6 Jan 2026 06:07:50 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767679670;
 b=y9znq8TFe+g8scOzzSAccHQviTwNESX76XxtuMCBzqIen8KJhybBQXRX31j/E9jhsUu2/
 6HNnZKn+AfuasrHc5HtF76fETtqtNDuw5I6brJo/EMvvqaE5vnosYxzduip55IVUKxugDOw
 /addH2ENBXhdSZMqlOv+uv6B1KyrIA5WfnBwgBuXISZVNEJEy3SuC6atNjX73TbJxE02BVV
 Hl2Dlo0cmwnQGlno+wdh4xbYQu1hsLb0i2IhSTEnENt3cSUPzn2339DwN/Az9TKs5nRGkII
 LtqqhWG9ksPRocn4+ZO4KdW7bEqnuu2ueKzPtGmUjPXpDAqrvVzkV9Wtb5lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767679670; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=T8hG9y1BZklptsV/xBAiq/b+CBwDpXaK8p7nFH8qK/k=;
 b=P0t8Q7hyJcIjpPr8mR5z2NW5W5mwwq3bEhS1P0ANJ/meQzeVYkC4F19Y+hq4816wBJ836
 et5XVG3nnKrYUVJ15i1AKBiCaUHIeOlYqPLtam9axLPP9q9/FklYYcBQtFgjWwdKXyS5txB
 JaLNWdFrSrWBQAf6/T+XR1gIwbngcczti569w6mtt3oI/H5JR+wm6/rLwyA9hLo9Ei9Mou1
 ZEPhvnXy+hj8gqBLqJ0SuZ0RqgIs6Ygwq0ifbD2AZF+JkMdQQT2pB6K59ERy1+UFwNPoNSF
 8l8kfdfAn98WPpSEWlgq8oEne0Y3gWQ0yu/4HyXlxB3lUfSPKGZJLCDAW0xQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=embeddedor.com;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=embeddedor.com; arc=none (Message is not ARC signed);
 dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 79C4544BB6
	for <nouveau@lists.freedesktop.org>; Tue,  6 Jan 2026 06:07:47 +0000 (UTC)
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Tue, 06 Jan 2026 06:15:59 UTC
Received: from omta038.useast.a.cloudfilter.net
 (omta038.useast.a.cloudfilter.net [44.202.169.37])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A90EF10E48C
	for <nouveau@lists.freedesktop.org>; Tue,  6 Jan 2026 06:15:59 +0000 (UTC)
Received: from eig-obgw-6005b.ext.cloudfilter.net ([10.0.30.162])
	by cmsmtp with ESMTPS
	id cqHDvespISkcfd0FPvRZAa; Tue, 06 Jan 2026 06:08:51 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id d0FLvy5RcHSQMd0FLv92ts; Tue, 06 Jan 2026 06:08:47 +0000
X-Authority-Analysis: v=2.4 cv=GIQIEvNK c=1 sm=1 tr=0 ts=695ca6f2
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=Aea70ojWhvW6xI+oM0giEQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=7T7KSl7uo7wA:10 a=VwQbUJbxAAAA:8
 a=9vlq1VobPfUJAe141Q0A:9 a=QEXdDO2ut3YA:10 a=2aFnImwKRvkU0tJ3nQRT:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=T8hG9y1BZklptsV/xBAiq/b+CBwDpXaK8p7nFH8qK/k=; b=pUw0IcUmyudnHEzadV7E5DiBFg
	NbxFokoAaw+dTAVWMOgnejpkK8g5Penu+9YGaRwrvUk3pN6HSR6U8CR0wP9HKSi6SROBuD39pHXKk
	oWMLarjaq710D+WwgE2G3o0doo4nc9jXiEeXNjIpBpXmcB/Dkv6hpwn/yyCZUpTTDr7mw6EkPMCoY
	9ae1pU31x35kKTk0QDqjuVfYs0Hp2bqfNpq5mLUG486O2d9A84bwTzCKM0goxDBC2N37l2SOqCLIf
	sRX7RGJQMxg/H+rfufKCMQyCIAxrSl2acbH6BrE25L97lXIP9+wHW+Ur2iYnkcIs2uSSHkUNbko/u
	2eBobKXQ==;
Received: from flh4-122-130-137-161.osk.mesh.ad.jp ([122.130.137.161]:60510
 helo=[10.221.196.44])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.98.1)
	(envelope-from <gustavo@embeddedor.com>)
	id 1vd0FK-00000002wEp-24z5;
	Tue, 06 Jan 2026 00:08:46 -0600
Message-ID: <e1009d16-cadb-4446-aef5-4a52197551a4@embeddedor.com>
Date: Tue, 6 Jan 2026 15:08:41 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3][next] drm/nouveau: fifo: Avoid
 -Wflex-array-member-not-at-end warning
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <aJ17oxJYcqqr3946@kspp>
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <aJ17oxJYcqqr3946@kspp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 122.130.137.161
X-Source-L: No
X-Exim-ID: 1vd0FK-00000002wEp-24z5
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: flh4-122-130-137-161.osk.mesh.ad.jp ([10.221.196.44])
 [122.130.137.161]:60510
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 5
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: 
 MS4xfI9FNMU/yo/dMSW0orld1VMRvqMQidlsRzKb7B1/gduEXUQWkayzfyZIfiIWpQS6COmPGImBXpX/FYe8q3A/AoMSPrCsectKyIKWjXvD+9VjWJRGWYgb
 +s/lAVSkTw9lKkayCLy9W7VQb9REJxLhhgkjqJLLf/v7BS/VeKacRsFbDWdi7KG7UhKvGrPDjbK20WhOSgaWsomHsnJjLxAoFmuFP3th3/8K1f6oef1esuCO
Message-ID-Hash: GDAXTUFPB7TIHOAZJ7LGARE6YKUIUVHX
X-Message-ID-Hash: GDAXTUFPB7TIHOAZJ7LGARE6YKUIUVHX
X-MailFrom: gustavo@embeddedor.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/GDAXTUFPB7TIHOAZJ7LGARE6YKUIUVHX/>
Archived-At: 
 <https://lore.freedesktop.org/e1009d16-cadb-4446-aef5-4a52197551a4@embeddedor.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Hi all,

Friendly ping: who can take this, please?

Thanks
-Gustavo

On 8/14/25 15:01, Gustavo A. R. Silva wrote:
> -Wflex-array-member-not-at-end was introduced in GCC-14, and we are
> getting ready to enable it, globally.
> 
> Use the new TRAILING_OVERLAP() helper to fix the following warning:
> 
> drivers/gpu/drm/nouveau/nvif/fifo.c:29:42: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> 
> This helper creates a union between a flexible-array member (FAM)
> and a set of members that would otherwise follow it. This overlays
> the trailing members onto the FAM while preserving the original
> memory layout.
> 
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
> Changes in v3:
>   - Use the new TRAILING_OVERLAP() helper.
> 
> Changes in v2:
>   - Adjust heap allocation.
> 
>   drivers/gpu/drm/nouveau/nvif/fifo.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvif/fifo.c b/drivers/gpu/drm/nouveau/nvif/fifo.c
> index a463289962b2..b0ab80995d98 100644
> --- a/drivers/gpu/drm/nouveau/nvif/fifo.c
> +++ b/drivers/gpu/drm/nouveau/nvif/fifo.c
> @@ -25,13 +25,12 @@ static int
>   nvif_fifo_runlists(struct nvif_device *device)
>   {
>   	struct nvif_object *object = &device->object;
> -	struct {
> -		struct nv_device_info_v1 m;
> +	TRAILING_OVERLAP(struct nv_device_info_v1, m, data,
>   		struct {
>   			struct nv_device_info_v1_data runlists;
>   			struct nv_device_info_v1_data runlist[64];
>   		} v;
> -	} *a;
> +	) *a;
>   	int ret, i;
>   
>   	if (device->runlist)

