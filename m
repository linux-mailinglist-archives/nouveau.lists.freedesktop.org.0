Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E15E598E2E
	for <lists+nouveau@lfdr.de>; Thu, 18 Aug 2022 22:39:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDCFB10E476;
	Thu, 18 Aug 2022 20:39:34 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60D0A10E476
 for <nouveau@lists.freedesktop.org>; Thu, 18 Aug 2022 20:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660855169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bpR/tJi/jrulna5YIAWe+qqOZ/zrYmmeUY37b7NZkCI=;
 b=R/1QhrlTYYY2xQfYeRyN/+XoEN5kNO7ZakHSCCENC3R1nrV8WGXa7BE/hfgQ/K9GKlo0kX
 WvMcZG1QIgXKvzOS7Hl6CVQOiI6cy/O+5CcVl/IonE8IRvVezzN05YdfUPiMB96fpUnmjn
 aigJbFVGzX095bEo5cusiR3FQ3epWhA=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-606-pKaRWSD8P6eLhN8QyTbo9g-1; Thu, 18 Aug 2022 16:39:28 -0400
X-MC-Unique: pKaRWSD8P6eLhN8QyTbo9g-1
Received: by mail-qt1-f198.google.com with SMTP id
 z10-20020a05622a124a00b003445680ff47so1978975qtx.8
 for <nouveau@lists.freedesktop.org>; Thu, 18 Aug 2022 13:39:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:user-agent:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc;
 bh=bpR/tJi/jrulna5YIAWe+qqOZ/zrYmmeUY37b7NZkCI=;
 b=NdJ1It8MU1+TksmEJt5elHrzZeel1cY6yDz6qrn4J6x8/37QhfrEYX7iPh04wfVN0g
 Ih8AlP58JcZXXPYIMFWKH7tH0x7atmjwYe04ukCsJIDHTldbIlxyRAReFUHUa1xSRdhZ
 zBsOpx1spIQgTuJD0Oae9Embi4s6PWFYP4Hx1VCezu1IpMrawbkEnk16ItQEkSmFXqwy
 U52SDgRkXi3+zCUlWeNAGMpZSglX3Fe5E9xUYCBZkE+BSwZSk/a76SeaJprYGFy1Ta12
 VSv0Uo0NIPWpBX9/I0gFdUK9hJxw9K7TVq+qMpm0GVThgAVsX1NUQucO6XZRYwbVu6Ao
 loOQ==
X-Gm-Message-State: ACgBeo1C0o1a6yM9FUEK2gkBDVc4hdi6nL2GhggSQIgrWQ/pbtdtbE5A
 3yza8hzLOIQ+h4emCCs9JERLx+e5FCbowCJiFzCHm2zWZySLiAGirey6jGHH/EhKjuL2yr0ULRb
 xmzYfR/b8hwBhSngYFFLyDhAxCA==
X-Received: by 2002:a05:622a:1aa2:b0:344:5ffd:3190 with SMTP id
 s34-20020a05622a1aa200b003445ffd3190mr4254618qtc.80.1660855167798; 
 Thu, 18 Aug 2022 13:39:27 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7EDStAK6GjaGlN339wGqtBhkMA6eDN3LHTMalY+SXOZUeP/bmGCfFuDWUG1RAaEssKn/9BMQ==
X-Received: by 2002:a05:622a:1aa2:b0:344:5ffd:3190 with SMTP id
 s34-20020a05622a1aa200b003445ffd3190mr4254606qtc.80.1660855167563; 
 Thu, 18 Aug 2022 13:39:27 -0700 (PDT)
Received: from [192.168.8.138] (pool-100-0-245-4.bstnma.fios.verizon.net.
 [100.0.245.4]) by smtp.gmail.com with ESMTPSA id
 bi24-20020a05620a319800b006b9d4f45c83sm2207050qkb.97.2022.08.18.13.39.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 13:39:26 -0700 (PDT)
Message-ID: <eac32fb892e7260efd8d5ad82696efa076c9e36e.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Karol Herbst <kherbst@redhat.com>
Date: Thu, 18 Aug 2022 16:39:25 -0400
In-Reply-To: <CACO55tvBR5exrpMP=mKhxZjfJVQxuvQoYApnwFZjQWxFv_6msQ@mail.gmail.com>
References: <CAHSpYy3G7EPhLBAiy4MgngKRqFgs1cTC-pnJb662vxxmkmxPXA@mail.gmail.com>
 <CAKb7UvhBekZhHhq=aD+hLCfOWe33whi_bScbLiDhXDwvEvbzfA@mail.gmail.com>
 <YWhgFZPqx3qKqr0C@debian.fritz.box>
 <CAKb7UviFVRe7hbtEXF6hUQh2TuZPthu+bt90h+8haf3A1FYt7g@mail.gmail.com>
 <2296778.YFyOdMMpyM@debian>
 <CAHSpYy1HJzY5kNoxk36yGRsKhmxQYP7FVM=Orn7RyKCtZc293w@mail.gmail.com>
 <CACO55tsJCPLw+UH6ADyHy62CfQKTtAwskoP86as2pwKnO7-NwQ@mail.gmail.com>
 <071b71819660d61d9b5caa368f683189a192754f.camel@redhat.com>
 <CACO55ttafiSS+eU=g0=uqwvU7yi+B_6LJK1VJ2FLObn6Rg8LYQ@mail.gmail.com>
 <31a134642314b288771637610659a4f50f971f27.camel@redhat.com>
 <CACO55tvBR5exrpMP=mKhxZjfJVQxuvQoYApnwFZjQWxFv_6msQ@mail.gmail.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] Advice about debugging nouveau driver suspend issue
 (init_on_alloc=1 and init_on_free=1)
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
Cc: Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

So then - if we can get this patch re-submitted with the /* TODO */ added,
I'll be happy to push this

On Fri, 2022-08-12 at 01:07 +0200, Karol Herbst wrote:
> On Thu, Aug 11, 2022 at 11:20 PM Lyude Paul <lyude@redhat.com> wrote:
> > 
> > On Thu, 2022-08-11 at 00:08 +0200, Karol Herbst wrote:
> > > the thing is, without this patch, the "hw path" fails with a timeout
> > > of... 30 seconds?, the code falls back to sw and it takes up to 2-3
> > > minutes to finish up. So even if this solution is overkill, it fixes a
> > > real issue. I suspect _something_ is bonkers with the fencing we do
> > > here and we don't see that the stuff is actually finished or whatever,
> > > or maybe we never emit the fence in the first place.. I didn't dig
> > > deep enough.
> > > 
> > > With this, it's really quick and everything.
> > 
> > I guess with a todo comment this is probably fine then, since this would only
> > really be affecting GPUs using m2mf anyway
> > 
> 
> I was mostly wondering if this is safe, but it probably is and it does
> fix real user issues. I don't have a better solution at the moment
> anyway.
> 
> > --
> > Cheers,
> >  Lyude Paul (she/her)
> >  Software Engineer at Red Hat
> > 
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

