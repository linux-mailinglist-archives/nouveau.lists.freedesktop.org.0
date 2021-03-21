Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 402C034359D
	for <lists+nouveau@lfdr.de>; Mon, 22 Mar 2021 00:05:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8816989E50;
	Sun, 21 Mar 2021 23:05:28 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mupuf.org (mupuf.org [167.71.42.210])
 by gabe.freedesktop.org (Postfix) with ESMTP id 90B0C89E5F
 for <nouveau@lists.freedesktop.org>; Sun, 21 Mar 2021 23:05:26 +0000 (UTC)
Received: from [IPv6:2a01:4b00:86b9:100:9ede:1593:85ef:7eda] (unknown
 [IPv6:2a01:4b00:86b9:100:9ede:1593:85ef:7eda])
 by Neelix.spliet.org (Postfix) with ESMTPSA id D3DCFF2013F
 for <nouveau@lists.freedesktop.org>; Sun, 21 Mar 2021 22:55:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 Neelix.spliet.org D3DCFF2013F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=spliet.org;
 s=default; t=1616367348;
 bh=kWsX/QfP8DD7tHzjQuUMkrZtYGiHNmaarVak97M1Ojs=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=X37VXvNL7gmDwX9ajTECiQSSBxQjwx15TzumWxbWKXaAL4rzizZdAN8GB9tBfRxEN
 vM7ZCYmbQWNEIKJnL8s/cM8iPPYTI1csfXGq8ivPMlBfJkbAPDuAU8WWE51G9wbNaE
 BAf0Fe8TkqgENmRSLt3qd5M6wDldzU67ROH6U/3M=
To: nouveau@lists.freedesktop.org
References: <20210305015242.740590-1-lyude@redhat.com>
 <20210308165050.qhhf5aqdcldet5p6@maple.lan>
From: Roy Spliet <nouveau@spliet.org>
Message-ID: <c13ac796-6e0d-06e4-61d5-ae10811c7009@spliet.org>
Date: Sun, 21 Mar 2021 22:55:48 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210308165050.qhhf5aqdcldet5p6@maple.lan>
Content-Language: en-GB
X-Spam-Status: No, score=-3.1 required=5.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A
 autolearn=unavailable autolearn_force=no version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on Neelix
X-Virus-Scanned: clamav-milter 0.103.1 at Neelix
X-Virus-Status: Clean
Subject: Re: [Nouveau] [PATCH] drm/nouveau/kms/nve4-nv108: Limit cursors to
 128x128
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

Tested-by: Roy Spliet <nouveau@spliet.org>

Op 08-03-2021 om 16:50 schreef Daniel Thompson:
> On Thu, Mar 04, 2021 at 08:52:41PM -0500, Lyude Paul wrote:
>> While Kepler does technically support 256x256 cursors, it turns out that
>> Kepler actually has some additional requirements for scanout surfaces that
>> we're not enforcing correctly, which aren't present on Maxwell and later.
>> Cursor surfaces must always use small pages (4K), and overlay surfaces must
>> always use large pages (128K).
>>
>> Fixing this correctly though will take a bit more work: as we'll need to
>> add some code in prepare_fb() to move cursor FBs in large pages to small
>> pages, and vice-versa for overlay FBs. So until we have the time to do
>> that, just limit cursor surfaces to 128x128 - a size small enough to always
>> default to small pages.
>>
>> This means small ovlys are still broken on Kepler, but it is extremely
>> unlikely anyone cares about those anyway :).
>>
>> Signed-off-by: Lyude Paul <lyude@redhat.com>
>> Fixes: d3b2f0f7921c ("drm/nouveau/kms/nv50-: Report max cursor size to userspace")
>> Cc: <stable@vger.kernel.org> # v5.11+
> 
> I was experiencing problems with the mouse cursor on my system in v5.11
> and after a bisect to help me search the web I found my way to this
> patch, which fixed the problem for me.
> 
> Mine is an Armv8 system but there is nothing particularly exotic from a
> graphics card or software point of view: Debian bullseye/wayland
> (gnome-shell 3.38.3, mesa-20.3.4) running on a GT-710.
> 
> However FWIW:
> Tested-by: Daniel Thompson <daniel.thompson@linaro.org>
> 
> 
> Daniel.
> 
> 
>> ---
>>   drivers/gpu/drm/nouveau/dispnv50/disp.c | 13 ++++++++++++-
>>   1 file changed, 12 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
>> index 196612addfd6..1c9c0cdf85db 100644
>> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
>> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
>> @@ -2693,9 +2693,20 @@ nv50_display_create(struct drm_device *dev)
>>   	else
>>   		nouveau_display(dev)->format_modifiers = disp50xx_modifiers;
>>   
>> -	if (disp->disp->object.oclass >= GK104_DISP) {
>> +	/* FIXME: 256x256 cursors are supported on Kepler, however unlike Maxwell and later
>> +	 * generations Kepler requires that we use small pages (4K) for cursor scanout surfaces. The
>> +	 * proper fix for this is to teach nouveau to migrate fbs being used for the cursor plane to
>> +	 * small page allocations in prepare_fb(). When this is implemented, we should also force
>> +	 * large pages (128K) for ovly fbs in order to fix Kepler ovlys.
>> +	 * But until then, just limit cursors to 128x128 - which is small enough to avoid ever using
>> +	 * large pages.
>> +	 */
>> +	if (disp->disp->object.oclass >= GM107_DISP) {
>>   		dev->mode_config.cursor_width = 256;
>>   		dev->mode_config.cursor_height = 256;
>> +	} else if (disp->disp->object.oclass >= GK104_DISP) {
>> +		dev->mode_config.cursor_width = 128;
>> +		dev->mode_config.cursor_height = 128;
>>   	} else {
>>   		dev->mode_config.cursor_width = 64;
>>   		dev->mode_config.cursor_height = 64;
>> -- 
>> 2.29.2
>>
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
