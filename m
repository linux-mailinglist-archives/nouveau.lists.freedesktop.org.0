Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 871C6576EDA
	for <lists+nouveau@lfdr.de>; Sat, 16 Jul 2022 16:38:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E50810E8F4;
	Sat, 16 Jul 2022 14:35:56 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E70CE10E05A
 for <nouveau@lists.freedesktop.org>; Fri, 15 Jul 2022 19:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657912194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YwoLVFK6VIqRxOLsO1/EQV9lnSFDUSQaM1LO6cP8vkU=;
 b=aclThvi8RvOWIABCYOzJl7vftIMr/Cn8f+/Qe2luKejmcMJXu8YHSmQPDGHcX1uXIbVGkA
 VjPhJuafiAKXTf2ElRjUhD5B6z5BMlWia8z5iVK9c4rs0VdwHuUQLwk0RbPLAqat+7ZsSj
 5hPO+ZEAL1CKbSvk6sfgHk5NMjl8vNQ=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-316-byFvZtH7No6ZLCuykO5vaw-1; Fri, 15 Jul 2022 15:09:51 -0400
X-MC-Unique: byFvZtH7No6ZLCuykO5vaw-1
Received: by mail-qv1-f70.google.com with SMTP id
 li2-20020a0562145e0200b0047350bbed70so3500126qvb.19
 for <nouveau@lists.freedesktop.org>; Fri, 15 Jul 2022 12:09:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=YwoLVFK6VIqRxOLsO1/EQV9lnSFDUSQaM1LO6cP8vkU=;
 b=SSuJaeFp7daRQeh18YYC/JBi+x8l9zO2JhMbzaEYOFXNb98UQ+q5nnwMRjc0bFIxQf
 I3RYGV3ZX18/o/LBDsI1fsNWCOtORrDkYmWoE225l5g1UNBP5wNfX0TZ8Kok+R5HUMu6
 yAXwPWoEU5v5qwxS9Zp4L9wvDz81wMZA6VVPFcXIpQBEpeXT8kU1z9RwBsQ+fBrLJpxy
 g9p9xThg/mRMsSuZAnw7DekLGreoNktGVLrTLO1SMUy4panPQJmlu3SOTajl1SvqCFr+
 xUcoysOD8wH9pxPlimPm7Ji3yZFN/WNA4pQrHk1hy4GT2MkVrTdIA3BauQGzEbBDgqUr
 0kiw==
X-Gm-Message-State: AJIora/zDApeSAtDo+3+2xPScJXkQuYv/iPFsIRZJjV5YiJ7GEbMCPKr
 1pxIaan0l92dF7Edu9wob26wHHVICl2CTRQNs5sbiG9qOrZ3sMRkB76zUZvttXPIyxpB+G+s1+O
 Vzl2dlUItmBucVz1RKMVDETGzOA==
X-Received: by 2002:a05:6214:3009:b0:473:990:6d08 with SMTP id
 ke9-20020a056214300900b0047309906d08mr13082699qvb.121.1657912190530; 
 Fri, 15 Jul 2022 12:09:50 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uohAkD70j3BSA3vDDBqmY1M2p1cVekKFciRB3de2UGHqsYQMYVH4O+M/IUZxKTSkZXjTdv5A==
X-Received: by 2002:a05:6214:3009:b0:473:990:6d08 with SMTP id
 ke9-20020a056214300900b0047309906d08mr13082681qvb.121.1657912190247; 
 Fri, 15 Jul 2022 12:09:50 -0700 (PDT)
Received: from [192.168.8.138] ([141.154.49.182])
 by smtp.gmail.com with ESMTPSA id
 f4-20020ac80684000000b0031eca8c88f6sm4017257qth.51.2022.07.15.12.09.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jul 2022 12:09:49 -0700 (PDT)
Message-ID: <44d6fc01654b16f9cdd6b517999ddec76038d547.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Tom Rix <trix@redhat.com>, bskeggs@redhat.com, kherbst@redhat.com, 
 airlied@linux.ie, daniel@ffwll.ch, nathan@kernel.org,
 ndesaulniers@google.com
Date: Fri, 15 Jul 2022 15:09:48 -0400
In-Reply-To: <91194b7190081545a8eeb10d20e24de864dfe259.camel@redhat.com>
References: <20220702153904.1696595-1-trix@redhat.com>
 <91194b7190081545a8eeb10d20e24de864dfe259.camel@redhat.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [PATCH] drm/nouveau/bios: set info only when the
 return is not 0
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
Cc: nouveau@lists.freedesktop.org, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, 2022-07-04 at 17:32 -0400, Lyude Paul wrote:
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> 
> Currently on flakey internet in the back of a car, so I probably won't be
> able
> to push this until I get back tonight or early tomorrow

Whoops! Slipped my mind when I got back, but I just remembered it now so I
will go ahead and push :). apologies for the delay!

> 
> On Sat, 2022-07-02 at 11:39 -0400, Tom Rix wrote:
> > clang static analysis reports
> > drivers/gpu/drm/nouveau/nvkm/subdev/bios/pmu.c:68:17: warning: The right
> > operand of '*' is a garbage value [core.UndefinedBinaryOperatorResult]
> >         switch (!!data * *ver) {
> >                        ^ ~~~~
> > A switch statement with only a default should be reduced to an if.
> > 
> > If nvbios_pmuEp() returns 0, via the data variable, the output info
> > parameter
> > is not used.  So set info only when data is not 0.
> > 
> > The struct nvbios_pmuE only has the type and data elements.  Since both of
> > these
> > are explicitly set, memset is not needed.  So remove it.
> > 
> > Signed-off-by: Tom Rix <trix@redhat.com>
> > ---
> >  drivers/gpu/drm/nouveau/nvkm/subdev/bios/pmu.c | 5 +----
> >  1 file changed, 1 insertion(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/pmu.c
> > b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/pmu.c
> > index b4a308f3cf7b..49e2664a734c 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/pmu.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/pmu.c
> > @@ -64,12 +64,9 @@ nvbios_pmuEp(struct nvkm_bios *bios, int idx, u8 *ver,
> > u8
> > *hdr,
> >              struct nvbios_pmuE *info)
> >  {
> >         u32 data = nvbios_pmuEe(bios, idx, ver, hdr);
> > -       memset(info, 0x00, sizeof(*info));
> > -       switch (!!data * *ver) {
> > -       default:
> > +       if (data) {
> >                 info->type = nvbios_rd08(bios, data + 0x00);
> >                 info->data = nvbios_rd32(bios, data + 0x02);
> > -               break;
> >         }
> >         return data;
> >  }
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

