Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 765DD4D0E9D
	for <lists+nouveau@lfdr.de>; Tue,  8 Mar 2022 05:27:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F38310E687;
	Tue,  8 Mar 2022 04:27:29 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6684410EA1F;
 Sat,  5 Mar 2022 09:51:47 +0000 (UTC)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4K9g3g4Tr5z9sT3;
 Sat,  5 Mar 2022 10:51:43 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7txCBD_yNCyT; Sat,  5 Mar 2022 10:51:43 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4K9g3g3jC8z9sSx;
 Sat,  5 Mar 2022 10:51:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6AEE38B766;
 Sat,  5 Mar 2022 10:51:43 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id bbc_MSMvmabX; Sat,  5 Mar 2022 10:51:43 +0100 (CET)
Received: from [192.168.204.180] (unknown [192.168.204.180])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B56C28B763;
 Sat,  5 Mar 2022 10:51:42 +0100 (CET)
Message-ID: <672043db-5290-293c-fde4-440989c78d09@csgroup.eu>
Date: Sat, 5 Mar 2022 10:51:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Lyude Paul <lyude@redhat.com>, Ben Skeggs <bskeggs@redhat.com>,
 Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
References: <2d97ae92b9c06214be0e088a72cf303eb591bf01.1646414295.git.christophe.leroy@csgroup.eu>
 <47e09d6010852db928c0de29b89450ea7eee74d8.camel@redhat.com>
 <edb9aabd-09af-ae0c-348d-f0500e3405d7@csgroup.eu>
In-Reply-To: <edb9aabd-09af-ae0c-348d-f0500e3405d7@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 08 Mar 2022 04:27:27 +0000
Subject: Re: [Nouveau] [PATCH] drm/nouveau/bios: Rename prom_init() and
 friends functions
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>



Le 05/03/2022 à 08:38, Christophe Leroy a écrit :
> 
> 
> Le 04/03/2022 à 21:24, Lyude Paul a écrit :
>> This mostly looks good to me. Just one question (and one comment down 
>> below
>> that needs addressing). Is this with ppc32? (I ask because ppc64le 
>> doesn't
>> seem to hit this compilation error).
> 
> That's with PPC64, see 
> http://kisskb.ellerman.id.au/kisskb/branch/chleroy/head/252ba609bea83234d2e35841c19ae84c67b43ec7/ 
> 
> 
> But that's not (yet) with the mainline tree. That's work I'm doing to 
> cleanup our asm/asm-protoypes.h header.
> 
> Since commit 4efca4ed05cb ("kbuild: modversions for EXPORT_SYMBOL() for 
> asm") that file is dedicated to prototypes of functions defined in 
> assembly. Therefore I'm trying to dispatch C functions prototypes in 
> other headers. I wanted to move prom_init() prototype into asm/prom.h 
> and then I hit the problem.
> 
> In the beginning I was thinking about just changing the name of the 
> function in powerpc, but as I see that M68K, MIPS and SPARC also have a 
> prom_init() function, I thought it would be better to change the name in 
> shadowrom.c to avoid any future conflict like the one I got while 
> reworking the headers.
> 
> 
>>> @@ -57,8 +57,8 @@ prom_init(struct nvkm_bios *bios, const char *name)
>>>   const struct nvbios_source
>>>   nvbios_rom = {
>>>          .name = "PROM",
>>> -       .init = prom_init,
>>> -       .fini = prom_fini,
>>> -       .read = prom_read,
>>> +       .init = nvbios_rom_init,
>>> +       .fini = nvbios_rom_fini,
>>> +       .read = nvbios_rom_read,
>>
>> Seeing as the source name is prom, I think using the naming convention
>> nvbios_prom_* would be better then nvbios_rom_*.
>>
> 
> Yes I wasn't sure about the best naming as the file name is shadowrom.c 
> and not shadowprom.c.
> 
> I will send v2 using nvbios_prom_* as a name.

While preparing v2 I remembered that in fact, I called the functions 
nvbios_rom_* because the name of the nvbios_source struct is nvbios_rom, 
so for me it made sense to use the name of the struct as a prefix for 
the functions.

So I'm OK to change it to nvbios_prom_* but it looks less logical to me.

Please confirm you still prefer nvbios_prom as prefix to the function names.

Christophe
