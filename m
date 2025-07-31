Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E05B1742F
	for <lists+nouveau@lfdr.de>; Thu, 31 Jul 2025 17:51:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5515C10E7BF;
	Thu, 31 Jul 2025 15:51:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="t8XCqO/G";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CF0310E7BF
 for <nouveau@lists.freedesktop.org>; Thu, 31 Jul 2025 15:51:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BC6E144035;
 Thu, 31 Jul 2025 15:51:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53349C4CEEF;
 Thu, 31 Jul 2025 15:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753977110;
 bh=sGB12Nb5+7kiLqTzx0SVj+FvEp/whs1svfbRU12ISY0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=t8XCqO/GhtH9dT78GjZw3Ht8IVHNOMOQXw5NRBmbC0W2r1Hg8sqDKmlDtpDH25NYC
 hsIwOBM90sqaAXiiP8NKqpMO+l2x98oGSSc8Si2QvQf9s+8BZJwsptUF9s73+NyCsP
 gzgJik7DoTZgNpFV5Suuh8Z36XcObm5EoVqqUqemJEwMH9+5GdHY6FouCmDb6WHs4n
 6s0OAcsyiIqu2RcEisfeB5YUZ6gm9lKszOyXW5qI5bTxORieuydauGUNbiJz7ebpUX
 4qTeH1f4uMokhttn5nuTm45EiUEoXXFNlSGQs+uavcqzOIGo0GDJVanb65Y5pMdaxG
 Kjc6/ADOGqPLw==
Message-ID: <af513e6e-b6a0-40ba-acf8-258bd4b95106@kernel.org>
Date: Thu, 31 Jul 2025 17:51:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/nouveau: Remove forgotten TODO
To: phasta@kernel.org
Cc: David Airlie <airlied@gmail.com>, Ben Skeggs <bskeggs@nvidia.com>,
 Simona Vetter <simona@ffwll.ch>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250409091413.94102-2-phasta@kernel.org>
 <Z_ZTrZ-dcD5YiSm4@cassiopeiae>
 <481a2808c235f95726d17803503b2b6dc2746dc3.camel@mailbox.org>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <481a2808c235f95726d17803503b2b6dc2746dc3.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


On 7/31/25 5:46 PM, Philipp Stanner wrote:
> On Wed, 2025-04-09 at 13:02 +0200, Danilo Krummrich wrote:
>> (+ Ben)
>>
>> On Wed, Apr 09, 2025 at 11:14:14AM +0200, Philipp Stanner wrote:
>>> commit ebb945a94bba ("drm/nouveau: port all engines to new engine module
>>> format") introduced a TODO to nouveau_chan.h, stating that an
>>> unspecified rework would take place in the "near future".
>>>
>>> Almost 13 years have passed since this "near future", so it can be
>>> safely assumed that the TODO is not needed anymore. Besides, its content
>>> is useless anyways since it does not specify *what* should have been
>>> done.
>>>
>>> Remove the TODO.
>>>
>>> Signed-off-by: Philipp Stanner <phasta@kernel.org>
>>> ---
>>>   drivers/gpu/drm/nouveau/nouveau_chan.h | 1 -
>>>   1 file changed, 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.h b/drivers/gpu/drm/nouveau/nouveau_chan.h
>>> index 016f668c0bc1..3b73ec91c4ff 100644
>>> --- a/drivers/gpu/drm/nouveau/nouveau_chan.h
>>> +++ b/drivers/gpu/drm/nouveau/nouveau_chan.h
>>> @@ -33,7 +33,6 @@ struct nouveau_channel {
>>>   		u64 addr;
>>>   	} push;
>>>   
>>> -	/* TODO: this will be reworked in the near future */
>>>   	bool accel_done;
>>
>> After having a brief look, it seems that it may has actually been reworked;
>> there is only a single use of accel_done, which is in FIRE_RING(), where it is
>> set to true. But it doesn't seem to be read from anywhere.
>>
>> So, I think we should remove both, the TODO and the accel_done field.
>>
>> @Ben: Maybe you remember the history of this.
> 
> Since we didn't get an answer – how do we want to continue with that,
> Danilo?

Removing the unused accel_done and the corresponding TODO should be fine, let's
do that.
