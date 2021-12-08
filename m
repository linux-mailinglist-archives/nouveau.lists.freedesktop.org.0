Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E4246DA3D
	for <lists+nouveau@lfdr.de>; Wed,  8 Dec 2021 18:43:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ACA56F5DB;
	Wed,  8 Dec 2021 17:43:48 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from manul.sfritsch.de (manul.sfritsch.de
 [IPv6:2a01:4f8:172:195f:112::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDDE96F5DB;
 Wed,  8 Dec 2021 17:43:47 +0000 (UTC)
Message-ID: <011690dd-ad46-c66b-7a8e-26ad3520f14d@sfritsch.de>
Date: Wed, 8 Dec 2021 18:43:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: de-DE
To: Dan Moulding <dmoulding@me.com>
References: <3bf72f52-0101-36e1-8c95-4bd983dd4f04@sfritsch.de>
 <20211207204528.6740-1-dmoulding@me.com>
From: Stefan Fritsch <sf@sfritsch.de>
In-Reply-To: <20211207204528.6740-1-dmoulding@me.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] Regression in 5.15 in nouveau
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
Cc: regressions@lists.linux.dev, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, regressions@leemhuis.info, bskeggs@redhat.com,
 christian.koenig@amd.com
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 07.12.21 21:45, Dan Moulding wrote:
>> There is a pretty obvious typo in there:
>>
>> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
>> @@ -359,7 +359,7 @@ nouveau_fence_sync(struct nouveau_bo *nvbo, struct
>> nouveau_channel *chan, bool e
>>                   fobj = dma_resv_shared_list(resv);
>>           }
>>
>> -       for (i = 0; (i < fobj ? fobj->shared_count : 0) && !ret; ++i) {
>> +       for (i = 0; i < (fobj ? fobj->shared_count : 0) && !ret; ++i) {
>>                   struct nouveau_channel *prev = NULL;
>>                   bool must_wait = true;
>>
>>
>> With that it works and I don't see the flickering in a short test. I
>> will do more testing, but maybe Dan can test, too.
>>
>> Cheers,
>> Stefan
> 
> After fixing the typo the patch is working for me, also. dmesg is also
> clean. I will continue running the patched kernel. If I see any
> issues, I will report back here.

OK, looks good: I have tested it on top of v5.15.5 for a day and no 
black flickering and no other problems. I am not qualified to review the 
patch, though.

Thanks for the quick responses to everyone.

Cheers,
Stefan
