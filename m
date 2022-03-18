Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB1A4DE0CC
	for <lists+nouveau@lfdr.de>; Fri, 18 Mar 2022 19:11:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0273C10E210;
	Fri, 18 Mar 2022 18:11:02 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC7C210E210
 for <nouveau@lists.freedesktop.org>; Fri, 18 Mar 2022 18:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647627058;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kc+pmtHfxIpRTamp8EGNmCLlGgRlmecF3rxkTdAqUlY=;
 b=S8ubzMa75a4C7EiWbrDhxzrlosh4sBOfG+HOykkI83t5t1CFI4MoiOFDR+8LZXp9nBtQXN
 3RXrkQwzYGaWyFgDh0A7/KRzdOroa/P3YA6DvdJEYQpCojlTHgAMvgh0yKhDG5/4x01qhj
 pH6KWlzlqYwQV/goBbxD4dv0I1y5hlw=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-30-ldMOs2wVMo-sJA8Gj3T50g-1; Fri, 18 Mar 2022 14:10:56 -0400
X-MC-Unique: ldMOs2wVMo-sJA8Gj3T50g-1
Received: by mail-qt1-f198.google.com with SMTP id
 k1-20020ac85fc1000000b002e1c5930386so6139428qta.3
 for <nouveau@lists.freedesktop.org>; Fri, 18 Mar 2022 11:10:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=kc+pmtHfxIpRTamp8EGNmCLlGgRlmecF3rxkTdAqUlY=;
 b=bdB2XGMMZC+H6dzxfEy+D0ubnd2RXmvNEuSvtWasuXxeSd74VkH/I0BFu0UCGfks3y
 LBg/pkRnjMuaZUVqpp6VM164Ji55h00uDXU37TLNEcjscm5CihZjCUaQZMIjLNs83a5p
 1ulE03qkAX9o67vSu/G/BgK2ATVNzdjrzDqJ46zEkDkWBTMTeGjoj9VQlMv7xzEjuuIe
 Lb/bH+gs+5vwJ2DYVS+KeqfE3QFueMjomK5VQQNxoy/AoPGEN5anc0oi4UZwdkex9ypQ
 OZIaXDlkB2yB90pC5eOChU5iR6uNV7tzvcq6ZYsbhOeTxTGnmNLhfjgcKne3OoZroPhJ
 KXoQ==
X-Gm-Message-State: AOAM532fPtZ4M5ptrOteXzzuRFsyYC6H9SO5oL2Znq3SrjXR18cme+Ey
 yaeL6GhodZiLM2CEJFM0Dxio5ny/R3OgPRenGI8lCb+djxBG+OJIS/1yzvInXpkUf+pb1jKAMBh
 RUb2/TiNd/1RvTwp/BXcA8YBOZQ==
X-Received: by 2002:a37:9fd3:0:b0:67b:126d:df0 with SMTP id
 i202-20020a379fd3000000b0067b126d0df0mr6766771qke.784.1647627055886; 
 Fri, 18 Mar 2022 11:10:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzydYXtEHBUS6lsWzvgP7SJvGqnoFV/FidiOKPv4KYQyt102wQaiSPRTJbjFy4LGZSduMs8mg==
X-Received: by 2002:a37:9fd3:0:b0:67b:126d:df0 with SMTP id
 i202-20020a379fd3000000b0067b126d0df0mr6766693qke.784.1647627054549; 
 Fri, 18 Mar 2022 11:10:54 -0700 (PDT)
Received: from [192.168.8.138] (pool-96-230-100-15.bstnma.fios.verizon.net.
 [96.230.100.15]) by smtp.gmail.com with ESMTPSA id
 d13-20020a05622a15cd00b002e1df990d01sm6200193qty.71.2022.03.18.11.10.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Mar 2022 11:10:53 -0700 (PDT)
Message-ID: <b3e5914f649a9cdc35fbbe9f399d3806f13c3a6f.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Ben Skeggs
 <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 18 Mar 2022 14:10:52 -0400
In-Reply-To: <9aebcbbf-aaba-f7e8-7397-18284e74ab0d@csgroup.eu>
References: <2d97ae92b9c06214be0e088a72cf303eb591bf01.1646414295.git.christophe.leroy@csgroup.eu>
 <47e09d6010852db928c0de29b89450ea7eee74d8.camel@redhat.com>
 <edb9aabd-09af-ae0c-348d-f0500e3405d7@csgroup.eu>
 <672043db-5290-293c-fde4-440989c78d09@csgroup.eu>
 <9aebcbbf-aaba-f7e8-7397-18284e74ab0d@csgroup.eu>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-1.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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

Whoops, sorry! I was unsure of the preference in name we should go with so I
poked Ben on the side to ask them, but I can see they haven't yet responded.
I'll poke thme again and see if I can get a response.

On Fri, 2022-03-18 at 10:55 +0100, Christophe Leroy wrote:
> Hi Paul,
> 
> Le 05/03/2022 à 10:51, Christophe Leroy a écrit :
> > 
> > 
> > Le 05/03/2022 à 08:38, Christophe Leroy a écrit :
> > > 
> > > 
> > > Le 04/03/2022 à 21:24, Lyude Paul a écrit :
> > > > This mostly looks good to me. Just one question (and one comment down 
> > > > below
> > > > that needs addressing). Is this with ppc32? (I ask because ppc64le 
> > > > doesn't
> > > > seem to hit this compilation error).
> > > 
> > > That's with PPC64, see 
> > > http://kisskb.ellerman.id.au/kisskb/branch/chleroy/head/252ba609bea83234d2e35841c19ae84c67b43ec7/
> > >  
> > > 
> > > 
> > > But that's not (yet) with the mainline tree. That's work I'm doing to 
> > > cleanup our asm/asm-protoypes.h header.
> > > 
> > > Since commit 4efca4ed05cb ("kbuild: modversions for EXPORT_SYMBOL() 
> > > for asm") that file is dedicated to prototypes of functions defined in 
> > > assembly. Therefore I'm trying to dispatch C functions prototypes in 
> > > other headers. I wanted to move prom_init() prototype into asm/prom.h 
> > > and then I hit the problem.
> > > 
> > > In the beginning I was thinking about just changing the name of the 
> > > function in powerpc, but as I see that M68K, MIPS and SPARC also have 
> > > a prom_init() function, I thought it would be better to change the 
> > > name in shadowrom.c to avoid any future conflict like the one I got 
> > > while reworking the headers.
> > > 
> > > 
> > > > > @@ -57,8 +57,8 @@ prom_init(struct nvkm_bios *bios, const char
> > > > > *name)
> > > > >   const struct nvbios_source
> > > > >   nvbios_rom = {
> > > > >          .name = "PROM",
> > > > > -       .init = prom_init,
> > > > > -       .fini = prom_fini,
> > > > > -       .read = prom_read,
> > > > > +       .init = nvbios_rom_init,
> > > > > +       .fini = nvbios_rom_fini,
> > > > > +       .read = nvbios_rom_read,
> > > > 
> > > > Seeing as the source name is prom, I think using the naming convention
> > > > nvbios_prom_* would be better then nvbios_rom_*.
> > > > 
> > > 
> > > Yes I wasn't sure about the best naming as the file name is 
> > > shadowrom.c and not shadowprom.c.
> > > 
> > > I will send v2 using nvbios_prom_* as a name.
> > 
> > While preparing v2 I remembered that in fact, I called the functions 
> > nvbios_rom_* because the name of the nvbios_source struct is nvbios_rom, 
> > so for me it made sense to use the name of the struct as a prefix for 
> > the functions.
> > 
> > So I'm OK to change it to nvbios_prom_* but it looks less logical to me.
> > 
> > Please confirm you still prefer nvbios_prom as prefix to the function 
> > names.
> > 
> 
> Are you still expecting a v2 for this patch ?
> 
> As the name of the structure is nvbios_rom, do you really prefer the 
> functions to be called nvbios_prom_* as you mentionned in your comment ?
> 
> In that case, do you also expect the structure name to be changed to 
> nvbios_prom ?
> 
> Thanks
> Christophe
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

