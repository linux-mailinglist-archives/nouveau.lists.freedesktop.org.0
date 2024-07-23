Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1F393A4B3
	for <lists+nouveau@lfdr.de>; Tue, 23 Jul 2024 19:07:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 706BB10E60B;
	Tue, 23 Jul 2024 17:07:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="EtBACXaa";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 558 seconds by postgrey-1.36 at gabe;
 Tue, 23 Jul 2024 17:07:18 UTC
Received: from smtp.smtpout.orange.fr (smtp-19.smtpout.orange.fr
 [80.12.242.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B166210E60B
 for <nouveau@lists.freedesktop.org>; Tue, 23 Jul 2024 17:07:18 +0000 (UTC)
Received: from [192.168.1.37] ([90.11.132.44]) by smtp.orange.fr with ESMTPA
 id WIpesiVSDHEYLWIpesUchI; Tue, 23 Jul 2024 18:57:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1721753878;
 bh=wj1wQJ9iiYsLZlo+kf2XG8doY7xq5pewUkzs5OpTqGI=;
 h=Message-ID:Date:MIME-Version:Subject:To:From;
 b=EtBACXaa2Vx7+SKDm7UwEu3ODg7UqXeU2xebyYaXckB1JFQFOCvaRZxGS6nuOHxG+
 wKhulQoAihHrfQhkJpSAWXJRnGscNN8ZgedU4IjbZXmUOUG4UDeNS7bV47evexknvu
 FpniogTkbPYjH0tiKqDiwjTUaYB5av/uAnNP2XDM97BxLzYSBhtkszyry4eaVBi5XB
 O6V7VYIk9CiUu8p7K9wRt/ROg3OpSFou7+UA0mxPay5sIXyPrGHbam39i3/2S2H4CI
 cBOZdfnGBLCWcuVH7m3YbNhcVwJO6eSS8NuS0aHGRzRwAvgN7npKh3U3ItToB5IGxi
 dHZQmbAPI47dw==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Tue, 23 Jul 2024 18:57:58 +0200
X-ME-IP: 90.11.132.44
Message-ID: <147bde68-2b66-4e0c-890d-30571a99eee1@wanadoo.fr>
Date: Tue, 23 Jul 2024 18:57:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/nouveau/debugfs: Simplify character output in
 nouveau_debugfs_vbios_image()
To: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 Danilo Krummrich <dakr@redhat.com>, David Airlie <airlied@gmail.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 LKML <linux-kernel@vger.kernel.org>, Markus Elfring <Markus.Elfring@web.de>
References: <cb21950b-286b-4630-9052-cff9e7e56337@web.de>
 <CAKb7Uvj513trzg9bVGrjcQ8CfO4anCq7e9mgbD0eZKh=zNLy=Q@mail.gmail.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <CAKb7Uvj513trzg9bVGrjcQ8CfO4anCq7e9mgbD0eZKh=zNLy=Q@mail.gmail.com>
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

Le 15/07/2024 à 15:15, Ilia Mirkin a écrit :
> On Mon, Jul 15, 2024 at 7:49 AM Markus Elfring <Markus.Elfring@web.de> wrote:
>>
>> From: Markus Elfring <elfring@users.sourceforge.net>
>> Date: Mon, 15 Jul 2024 13:36:54 +0200
>>
>> Single characters should be put into a sequence.
>> Thus use the corresponding function “seq_putc” for one selected call.
>>
>> This issue was transformed by using the Coccinelle software.
>>
>> Suggested-by: Christophe Jaillet <christophe.jaillet@wanadoo.fr>
>> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
>> ---
>>   drivers/gpu/drm/nouveau/nouveau_debugfs.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
>> index e83db051e851..931b62097366 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
>> @@ -42,7 +42,7 @@ nouveau_debugfs_vbios_image(struct seq_file *m, void *data)
>>          int i;
>>
>>          for (i = 0; i < drm->vbios.length; i++)
>> -               seq_printf(m, "%c", drm->vbios.data[i]);
>> +               seq_putc(m, drm->vbios.data[i]);
> 
> Is there some reason this whole thing isn't just
> 
> seq_write(m, drm->vbios.data, drm->vbios.length)

Hi,

I don't know if my answer is relevant or not here but:
	for () seq_putc();	==> will fill 'm' with everything that fits in
and
	seq_write()		==> is all or nothing. So if 'm' is too small, then 
nothing will be appended.

I've not looked at the calling tree, but I would expect 'm' to be able 
to have PAGE_SIZE chars, so most probably 4096.

And having gpu + "vbios.rom", I would expect it to be bigger than 4096.

If I'm correct, then changing for seq_write() would just show... nothing.


I don't know if it can happen., but testing should be easy enough to 
figure it out.

just my 2c.

CJ



> 
>>          return 0;
>>   }
>>
>> --
>> 2.45.2
>>
> 
> 

