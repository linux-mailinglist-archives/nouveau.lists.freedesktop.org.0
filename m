Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 411C9CFC336
	for <lists+nouveau@lfdr.de>; Wed, 07 Jan 2026 07:42:51 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 345B110E099;
	Wed,  7 Jan 2026 06:42:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=embeddedor.com header.i=@embeddedor.com header.b="l4kevgBy";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 51F8744CA0;
	Wed,  7 Jan 2026 06:34:32 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767767672;
 b=S2Y4tjDPSugujtM6o57Q6uH51MC6JmETNQUeWoy4uAKC5fgs80ftZPRwnswMuyQdI4hAq
 Ms6m8vXxNukZETB4nz10lfjAMtrS2E6Dbf2fIa/KtYB3M96viquZkrrmJ2Jy2ajqhSfHfen
 ilX8g5orToL4SlRbCXABnU7a5BWG5KAXrD1zgmdXRbGLppv+xnesU93HxzH86J8wzC+veBD
 m++HSr0E6OtmE3mMGuNvbfZ6VeQ3eZjZN/xLiL3x9qbi/AyD7h/r3Lc+kw/4912ZnNIDUgt
 AgKFoP13EPHfTRTeMFNMYL1OAYPK4Q8fGWwVNYhAM2Cd33xUiCtV1UgRyEaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767767672; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=b61X3jZlNTO3XN8ImRNF8VeXxeNII79YjBB4Nfpnz6I=;
 b=AVCIg1C+NWmFnJNZnz+4BGTrn11VrwwHjRjNoIq5qgZZSKO9JM5yy7kK5ak0DC3zo2dKR
 9d6WBm1yUTPv6H30p56bFtLYA5AULhAIx9keoX6fCd4kXJ5A78Me0U6k9fgDMjYerYnHuW+
 NbNCYzK6PYiVd9+DDGevCQg2ljXcqS0GQSUmct39rrFxRtfhiUO4UsyFYc8oY8AY/+fWQWj
 QmAWmCgf7Cn/lXSGwP1WOZDVhw1G7cX+iqGSSPZxlGp/EiolwUVQ2unZpNakpSNSkibbZvT
 qN4ay9QfoCuxAcQN0GHQ3eSSc/j+mq4VjhLCoC9avH04DlAsEzfTG2PaWh/Q==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=embeddedor.com;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=embeddedor.com; arc=none (Message is not ARC signed);
 dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id AE8C144B98
	for <nouveau@lists.freedesktop.org>; Wed,  7 Jan 2026 06:34:29 +0000 (UTC)
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Wed, 07 Jan 2026 06:42:44 UTC
Received: from omta36.uswest2.a.cloudfilter.net
 (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2D55910E00B
	for <nouveau@lists.freedesktop.org>; Wed,  7 Jan 2026 06:42:44 +0000 (UTC)
Received: from eig-obgw-6002b.ext.cloudfilter.net ([10.0.30.203])
	by cmsmtp with ESMTPS
	id dMafvY5rNVCBNdN8qvS3Wt; Wed, 07 Jan 2026 06:35:36 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id dN8pvTaGgPL32dN8qvzv7e; Wed, 07 Jan 2026 06:35:36 +0000
X-Authority-Analysis: v=2.4 cv=MqhS63ae c=1 sm=1 tr=0 ts=695dfeb8
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=Aea70ojWhvW6xI+oM0giEQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=7T7KSl7uo7wA:10 a=VwQbUJbxAAAA:8
 a=0GjfSR-a_gbzBSTCPL8A:9 a=QEXdDO2ut3YA:10 a=2aFnImwKRvkU0tJ3nQRT:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=b61X3jZlNTO3XN8ImRNF8VeXxeNII79YjBB4Nfpnz6I=; b=l4kevgByUnt+MnUp1PWZPYh+Ej
	GogpXA0x4KEirmi1SRHjzg7R2rWbOlUNVZv2MkUsephPC3PXaAi72eTErLIeBusmenntGC1OdPjjy
	Igi6sGc5j/b4MYzpg0VSivUKiH0LQsFkK1V3nH+Y4zamhICOdm3u7xoGfh/ceadFaee3zLp1qr950
	P0ye8BDFX5OvuMjBW/Tk+z1TEYbpxGkLRi8ro3gXmL1OZYz2J8MWa3vs4nn2CkCxXGB/17MdJRSJx
	nafW+1rPJqAwr2G05Aj0bTMpoyhfKa0bYGL8fZa6GSrqwQscf4ToTWzO7IKPNnijY7uztlRl0F4be
	jm0haj1A==;
Received: from flh4-122-130-137-161.osk.mesh.ad.jp ([122.130.137.161]:45860
 helo=[10.221.196.44])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.98.1)
	(envelope-from <gustavo@embeddedor.com>)
	id 1vdN8p-00000003Gyh-0fE5;
	Wed, 07 Jan 2026 00:35:35 -0600
Message-ID: <69342e4a-3a2f-4fa4-a7a9-76d05a15e985@embeddedor.com>
Date: Wed, 7 Jan 2026 15:35:24 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3][next] drm/nouveau: fifo: Avoid
 -Wflex-array-member-not-at-end warning
To: Kees Cook <kees@kernel.org>, Danilo Krummrich <dakr@kernel.org>
References: <aJ17oxJYcqqr3946@kspp>
 <e1009d16-cadb-4446-aef5-4a52197551a4@embeddedor.com>
 <b4e596b0-4e6d-40b8-933c-f407f2cc0980@kernel.org>
 <202601061220.EDD0476@keescook>
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <202601061220.EDD0476@keescook>
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
X-Exim-ID: 1vdN8p-00000003Gyh-0fE5
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: flh4-122-130-137-161.osk.mesh.ad.jp ([10.221.196.44])
 [122.130.137.161]:45860
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 3
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: 
 MS4xfHKchmUcduqtPuo92gd+CEkDNqsPusibN7OFi+RfEDuhOeWfBcxLGBc0A0EVc/aRyWin2KVjgLGFbDrg0rG/QCcVnjqbo3SrPvZbO5f/sz3VCk+ISNd8
 RRbg62g8gAUKiFcPFu/CMVC10qQS23xvOPh6BwtbF/nt7zkJbXl/n6YUQQRtnEnURYU+SCiUrkL8TsYQH1uGUfFQnjW2rWqi4fK3zkq/gtp4k7UIDedzMdcP
Message-ID-Hash: WREDLG4DW753MGQJGCFXNU7HXBZMDSJQ
X-Message-ID-Hash: WREDLG4DW753MGQJGCFXNU7HXBZMDSJQ
X-MailFrom: gustavo@embeddedor.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/WREDLG4DW753MGQJGCFXNU7HXBZMDSJQ/>
Archived-At: 
 <https://lore.freedesktop.org/69342e4a-3a2f-4fa4-a7a9-76d05a15e985@embeddedor.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>



On 1/7/26 05:21, Kees Cook wrote:
> On Tue, Jan 06, 2026 at 09:14:36PM +0100, Danilo Krummrich wrote:
>> On 1/6/26 7:08 AM, Gustavo A. R. Silva wrote:
>>> Friendly ping: who can take this, please?
>> For some reason this patch wasn't tagged for applying in my inbox -- seems like
>> it slipped through.
>>
>> I was about to pick it up, but recognized just in time that Kees already took it
>> through his hardening tree.
> 
> Ah great!
> 
>> Sorry for the delay; thanks Kees for picking it up. Even though already applied,
>> please consider this patch:
>>
>> 	Acked-by: Danilo Krummrich <dakr@kernel.org>
> 
> Thanks! I had figured it was slipping through the cracks so I snagged
> it. I'll add your Ack. :) If you'd rather take it, just say the word and
> I can drop it from my tree.

Thank you both!

-Gustavo
