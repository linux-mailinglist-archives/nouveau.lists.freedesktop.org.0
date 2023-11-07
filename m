Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB327E47EF
	for <lists+nouveau@lfdr.de>; Tue,  7 Nov 2023 19:12:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B1C610E641;
	Tue,  7 Nov 2023 18:11:58 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hs01.dakr.org (hs01.dk-develop.de [173.249.23.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EB8210E641
 for <nouveau@lists.freedesktop.org>; Tue,  7 Nov 2023 18:11:56 +0000 (UTC)
Message-ID: <fa523631-480d-496a-a370-ebda589b441f@dakr.org>
Date: Tue, 7 Nov 2023 19:11:44 +0100
MIME-Version: 1.0
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>, Timur Tabi <ttabi@nvidia.com>
References: <b9a97887-9b58-4518-8dd8-3865afb9279b@moroto.mountain>
 <f9a53aa8399313a323232744be57c9908f674f1b.camel@nvidia.com>
 <f6381720-3b0b-40be-a705-0decdf0a3800@kadam.mountain>
From: Danilo Krummrich <me@dakr.org>
In-Reply-To: <f6381720-3b0b-40be-a705-0decdf0a3800@kadam.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [bug report] drm/nouveau/mmu/r535: initial support
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
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 11/7/23 16:17, Dan Carpenter wrote:
> On Tue, Nov 07, 2023 at 03:06:27PM +0000, Timur Tabi wrote:
>> On Tue, 2023-11-07 at 17:32 +0300, Dan Carpenter wrote:
>>>      170         ret = gf100_bar_new_(rm, device, type, inst, &bar);
>>> --> 171         *pbar = bar;
>>>      172         if (ret) {
>>>      173                 if (!bar)
>>>                              ^^^^
>>> If gf100_bar_new_() fails then bar isn't initialized.  Do we really
>>> need to initialize bar to NULL on error?  If so then we should do it
>>> before the "rm = kzalloc()".
>>
>> We can just do this:
>>
>> struct nvkm_bar *bar = NULL;
> 
> I mean that will silence the warning, but why are we setting *pbar to
> NULL?  If it's necessary then there is still a bug because the first
> error path doesn't do it.

I think the problem already starts with gf100_bar_new_() not setting its
pbar argument to NULL on failure, but this code assuming that.

Generally, I think it would be better if all those functions would return
an ERR_PTR on failure.

However, the common pattern in nvkm seems to be that one can't trust those
pointer arguments on failure. Hence, your code below seems to be the correct
fix.

> If not, then just do:
> 
> 	ret = gf100_bar_new_(rm, device, type, inst, &bar);
> 	if (ret) {
> 		kfree(rm);
> 		return ret;
> 	}
> 	*pbar = bar;
> 
> It really depends on what we're doing with *pbar.  I looked at the
> context before I sent the bug report and it kind of looked like this
> function is dead code honestly...

It's used by tu102_bar_new() which is used by the chipset structures in
drivers/gpu/drm/nouveau/nvkm/engine/device/base.c.

On driver initialization there are a few magic macros calling all those
function pointers from the chipset structures. [1]

[1] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c#L3220

> 
> regards,
> dan carpenter
