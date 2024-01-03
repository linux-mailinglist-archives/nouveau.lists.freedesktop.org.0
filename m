Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C0F822D6F
	for <lists+nouveau@lfdr.de>; Wed,  3 Jan 2024 13:47:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1313210E28D;
	Wed,  3 Jan 2024 12:47:17 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail.kernel-space.org (mail.kernel-space.org [195.201.34.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DA3A10E28D
 for <nouveau@lists.freedesktop.org>; Wed,  3 Jan 2024 12:47:14 +0000 (UTC)
Received: from kernel-space.org (localhost [127.0.0.1])
 by kernel-space.org (OpenSMTPD) with ESMTP id 03745d6c
 for <nouveau@lists.freedesktop.org>;
 Wed, 3 Jan 2024 12:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=kernel-space.org; h=
 message-id:date:mime-version:subject:to:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=s1; bh=8J
 15gv2U1H+YbGAmepDg5hfA8EU=; b=p+ElgE7hfINoSE8MG1QNrd7ixAAa3Qmx1s
 nzUFNH+tcdRgIfV5JD0YGnEyodbcQ2YgygPegylb1XHAPrDtPbrxlby3Cxm9aQm2
 ZPd4VHSvK//XdpTwKu4r0pV2BypFU/wVS5WQHFYebSbLAFs0l4uANjoDgV7HmSwo
 JQz8W5W8o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=kernel-space.org; h=
 message-id:date:mime-version:subject:to:references:from
 :in-reply-to:content-type:content-transfer-encoding; q=dns; s=s1; b=
 txz7q7+w/fBqJiqySyRYl5TNH7Ko4svJbBSDkWG5hZqU+Y8m42MY3ZwDQv0p2DuD
 2D68H7LSd0kVCUwh8kYI61Zr19krRu0z+Eyr0Pu8YYqY+k83SD5o9JWbwFRiz9it
 HavU5k5qTHcJQdRDbZQ+DnUqOMIUrv0Cf4YtG9n/1jc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel-space.org;
 s=s1; t=1704285969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bpZ9GQngbxPqQZq+nyHch4jz3at0s9o7Ihcg+CK5YW0=;
 b=bPL7nizCrRzBHSMegm7AVg8VSxPcroqGRKfBnClgPr2CpstVyjKLoFb/oTxPJ4V3XlqsfD
 iIfWuwO6Y84L9WV1BMjjqGofY2xqShM+IrB3ULBooKkUMe+PadxXsHvkQBjwOvd1PWGAop
 UdhbNb7G40pxd9RkZNBvnz+N/bql5vA=
Received: from [192.168.0.2] (host-79-41-232-3.retail.telecomitalia.it
 [79.41.232.3])
 by kernel-space.org (OpenSMTPD) with ESMTPSA id f900b6bd
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <nouveau@lists.freedesktop.org>;
 Wed, 3 Jan 2024 12:46:09 +0000 (UTC)
Message-ID: <6f95e4d5-70dc-06f9-916a-dbd1fe72b119@kernel-space.org>
Date: Wed, 3 Jan 2024 13:46:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Betterbird/102.11.0
Subject: Re: AD107M (197), black screen
To: nouveau@lists.freedesktop.org
References: <52131e33-fc34-1a6f-17b8-4e3f30757192@kernel-space.org>
Content-Language: en-US, it
From: Angelo Dureghello <angelo@kernel-space.org>
In-Reply-To: <52131e33-fc34-1a6f-17b8-4e3f30757192@kernel-space.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi,

could get some logs by ssh

~ > sudo dmesg | grep nouveau 
                 err 1|1 angelo@yamato 13:46:10
[    3.353504] nouveau: detected PR support, will not use DSM
[    3.353855] nouveau 0000:01:00.0: vgaarb: deactivate vga console
[    3.353950] nouveau 0000:01:00.0: NVIDIA AD107 (197000a1)
[    3.589011] nouveau 0000:01:00.0: bios: version 95.07.18.00.e0
[    4.485925] nouveau 0000:01:00.0: gsp:msg fn:4123 len:0x24/0x4 
res:0x0 resp:0x0
[    4.487456] nouveau 0000:01:00.0: gsp:msg fn:4108 len:0x38/0x18 
res:0x0 resp:0x0
[    4.487782] nouveau 0000:01:00.0: gsp:msg fn:4108 len:0x40/0x20 
res:0x0 resp:0x0
[    4.617959] nouveau 0000:01:00.0: DRM: VRAM: 8188 MiB
[    4.617963] nouveau 0000:01:00.0: DRM: GART: 536870912 MiB
[    4.662175] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
[    4.753423] snd_hda_intel 0000:01:00.1: bound 0000:01:00.0 (ops 
nv50_audio_component_bind_ops [nouveau])
[    4.759238] [drm] Initialized nouveau 1.4.0 20120801 for 0000:01:00.0 
on minor 0
[    4.786497] fbcon: nouveaudrmfb (fb0) is primary device
[    5.064688] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x00730000 
ctrl cmd:0x00731341 failed: 0x00000055
[    5.065580] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x00730000 
ctrl cmd:0x00731341 failed: 0x00000055
[    5.066473] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x00730000 
ctrl cmd:0x00731341 failed: 0x00000055
[    5.067242] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x00730000 
ctrl cmd:0x00731341 failed: 0x00000055
[    5.068115] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x00730000 
ctrl cmd:0x00731341 failed: 0x00000055
[    5.068989] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x00730000 
ctrl cmd:0x00731341 failed: 0x00000055
[    5.069860] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x00730000 
ctrl cmd:0x00731341 failed: 0x00000055
[    5.070737] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x00730000 
ctrl cmd:0x00731341 failed: 0x00000055
[    5.071609] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x00730000 
ctrl cmd:0x00731341 failed: 0x00000055
[    5.072482] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x00730000 
ctrl cmd:0x00731341 failed: 0x00000055
[    5.073355] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x00730000 
ctrl cmd:0x00731341 failed: 0x00000055
[    5.074227] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x00730000 
ctrl cmd:0x00731341 failed: 0x00000055
[    5.075100] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x00730000 
ctrl cmd:0x00731341 failed: 0x00000055
[    5.075974] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x00730000 
ctrl cmd:0x00731341 failed: 0x00000055
[    5.076846] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x00730000 
ctrl cmd:0x00731341 failed: 0x00000055
[    5.077738] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x00730000 
ctrl cmd:0x00731341 failed: 0x00000055
[    5.078611] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x00730000 
ctrl cmd:0x00731341 failed: 0x00000055
[    5.079483] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x00730000 
ctrl cmd:0x00731341 failed: 0x00000055
[    5.080359] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x00730000 
ctrl cmd:0x00731341 failed: 0x00000055
[    5.081231] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x00730000 
ctrl cmd:0x00731341 failed: 0x00000055
[    5.082105] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x00730000 
ctrl cmd:0x00731341 failed: 0x00000055
[    5.082978] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x00730000 
ctrl cmd:0x00731341 failed: 0x00000055
[    5.083859] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x00730000 
ctrl cmd:0x00731341 failed: 0x00000055
[    5.084731] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x00730000 
ctrl cmd:0x00731341 failed: 0x00000055
[    5.085604] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x00730000 
ctrl cmd:0x00731341 failed: 0x00000055
[    5.086477] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x00730000 
ctrl cmd:0x00731341 failed: 0x00000055
[    5.087261] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x00730000 
ctrl cmd:0x00731341 failed: 0x00000055
[    5.088134] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x00730000 
ctrl cmd:0x00731341 failed: 0x00000055
[    5.089008] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x00730000 
ctrl cmd:0x00731341 failed: 0x00000055
[    5.089881] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x00730000 
ctrl cmd:0x00731341 failed: 0x00000055
[    5.090738] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x00730000 
ctrl cmd:0x00731341 failed: 0x00000055
[    5.091611] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x00730000 
ctrl cmd:0x00731341 failed: 0x00000055
[    5.091873] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x00730000 
ctrl cmd:0x00731343 failed: 0x00000055
[    5.091874] nouveau 0000:01:00.0: DRM: [DRM/0000000d:kmsOutp] 
[DP_TRAIN retrain:0 mst:0 lttprs:0 post_lt_adj:0 nr:4 bw:810000] (ret:-22)
[    5.092063] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x00730000 
ctrl cmd:0x00731343 failed: 0x00000055
[    5.092064] nouveau 0000:01:00.0: DRM: [DRM/0000000d:kmsOutp] 
[DP_TRAIN retrain:0 mst:0 lttprs:0 post_lt_adj:0 nr:4 bw:540000] (ret:-22)
[    5.092216] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x00730000 
ctrl cmd:0x00731343 failed: 0x00000055
[    5.092217] nouveau 0000:01:00.0: DRM: [DRM/0000000d:kmsOutp] 
[DP_TRAIN retrain:0 mst:0 lttprs:0 post_lt_adj:0 nr:4 bw:432000] (ret:-22)
[    5.092368] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x00730000 
ctrl cmd:0x00731343 failed: 0x00000055
[    5.092369] nouveau 0000:01:00.0: DRM: [DRM/0000000d:kmsOutp] 
[DP_TRAIN retrain:0 mst:0 lttprs:0 post_lt_adj:0 nr:4 bw:324000] (ret:-22)
[    5.092594] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x00730000 
ctrl cmd:0x00731343 failed: 0x00000055
[    5.092595] nouveau 0000:01:00.0: DRM: [DRM/0000000d:kmsOutp] 
[DP_TRAIN retrain:0 mst:0 lttprs:0 post_lt_adj:0 nr:4 bw:270000] (ret:-22)
[    5.092857] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x00730000 
ctrl cmd:0x00731343 failed: 0x00000055
[    5.092858] nouveau 0000:01:00.0: DRM: [DRM/0000000d:kmsOutp] 
[DP_TRAIN retrain:0 mst:0 lttprs:0 post_lt_adj:0 nr:2 bw:810000] (ret:-22)
[    5.093120] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x00730000 
ctrl cmd:0x00731343 failed: 0x00000055
[    5.093121] nouveau 0000:01:00.0: DRM: [DRM/0000000d:kmsOutp] 
[DP_TRAIN retrain:0 mst:0 lttprs:0 post_lt_adj:0 nr:2 bw:540000] (ret:-22)
[    7.093173] nouveau 0000:01:00.0: DRM: core notifier timeout
[    9.093232] nouveau 0000:01:00.0: DRM: core notifier timeout
[   11.093272] nouveau 0000:01:00.0: DRM: wndw-0: timeout
[   11.105227] nouveau 0000:01:00.0: [drm] fb0: nouveaudrmfb frame 
buffer device
[   15.140669] nouveau 0000:01:00.0: gsp:msg fn:4123 len:0x24/0x4 
res:0x0 resp:0x0
[   19.141225] nouveau 0000:01:00.0: gsp:msg fn:4123 len:0x24/0x4 
res:0x0 resp:0x0
[   23.141643] nouveau 0000:01:00.0: gsp:msg fn:4123 len:0x24/0x4 
res:0x0 resp:0x0
[   27.142110] nouveau 0000:01:00.0: gsp:msg fn:4123 len:0x24/0x4 
res:0x0 resp:0x0
[   31.142497] nouveau 0000:01:00.0: gsp:msg fn:4123 len:0x24/0x4 
res:0x0 resp:0x0
[   35.142881] nouveau 0000:01:00.0: gsp:msg fn:4123 len:0x24/0x4 
res:0x0 resp:0x0
[   35.143168] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x00730000 
ctrl cmd:0x00731341 failed: 0x00000055
[   39.147811] nouveau 0000:01:00.0: gsp:msg fn:4123 len:0x24/0x4 
res:0x0 resp:0x0
[   43.148282] nouveau 0000:01:00.0: gsp:msg fn:4123 len:0x24/0x4 
res:0x0 resp:0x0
[   47.148711] nouveau 0000:01:00.0: gsp:msg fn:4123 len:0x24/0x4 
res:0x0 resp:0x0
[   51.149125] nouveau 0000:01:00.0: gsp:msg fn:4123 len:0x24/0x4 
res:0x0 resp:0x0
[   55.149565] nouveau 0000:01:00.0: gsp:msg fn:4123 len:0x24/0x4 
res:0x0 resp:0x0
[   55.149865] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x00730000 
ctrl cmd:0x00731341 failed: 0x00000025
[   59.150551] nouveau 0000:01:00.0: gsp:msg fn:4123 len:0x24/0x4 
res:0x0 resp:0x0
[   63.150990] nouveau 0000:01:00.0: gsp:msg fn:4123 len:0x24/0x4 
res:0x0 resp:0x0
[   67.151460] nouveau 0000:01:00.0: gsp:msg fn:4123 len:0x24/0x4 
res:0x0 resp:0x0
[   71.151907] nouveau 0000:01:00.0: gsp:msg fn:4123 len:0x24/0x4 
res:0x0 resp:0x0
[   75.152330] nouveau 0000:01:00.0: gsp:msg fn:4123 len:0x24/0x4 
res:0x0 resp:0x0
[   75.152615] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x00730000 
ctrl cmd:0x00731341 failed: 0x00000025
[   79.153316] nouveau 0000:01:00.0: gsp:msg fn:4123 len:0x24/0x4 
res:0x0 resp:0x0

Regards,
angelo

On 03/01/24 1:40 PM, Angelo Dureghello wrote:
> Hi all,
> 
> i am testing current mainline (6.7.rc8), on
> a lenovo legion, with AD107M (chipset 197000a1).
> 
> Looks like somewhere at driver probe, screen turns
> black and stays forever. If any hint, welcome.
> 
> I can help debugging, rebuilding and testing in case.
> 
> Regards,
> Angelo Dureghello
