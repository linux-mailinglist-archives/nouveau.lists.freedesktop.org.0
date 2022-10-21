Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA0B608090
	for <lists+nouveau@lfdr.de>; Fri, 21 Oct 2022 23:10:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D571B10E16F;
	Fri, 21 Oct 2022 21:10:42 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2AFB10E16F
 for <nouveau@lists.freedesktop.org>; Fri, 21 Oct 2022 21:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666386637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=anJK3u7o1LGM1hJxCKuJjx/7vxRzIZ98WYXelaeIQaw=;
 b=DQtkzGmjA7zXPd/QToFZ832BkNk3g0b3KY+UUEve7Z3mU9FWLN8LeYaqtDQ05xHbg1emFM
 Rv7oixtZkhGEtY/dnR/qRTy2Cbt+d7z/uQZPrGI0u4HaO301qcr6Hg5/jIIckLlAKZViaF
 tTuVOYiBYS+zQN9nXOt0Gc95O8Twl/Y=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-520-rI-tH7e4PiiCdtZAievCGw-1; Fri, 21 Oct 2022 17:10:36 -0400
X-MC-Unique: rI-tH7e4PiiCdtZAievCGw-1
Received: by mail-qk1-f197.google.com with SMTP id
 u7-20020a05620a0c4700b006ee526183fcso4406453qki.8
 for <nouveau@lists.freedesktop.org>; Fri, 21 Oct 2022 14:10:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:user-agent:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=anJK3u7o1LGM1hJxCKuJjx/7vxRzIZ98WYXelaeIQaw=;
 b=TKiCK6yywiwS5rDAOvxBXs5N6CimGDTo4Y5YBNPc/NtKNPVrrfO9IJDrnLGHv/C3D+
 GyVz8Y+h1IYHGg40IIFWJCdIGifDl7zgHyZ/LYsRSlmXlady4oIlCGS6BOhGPazlSVO5
 Y+zr8dgIOJDDPMOKLK51zJZI9t0B7E2FqToAxMJnN1sPa1kDtZZmd46FwVi4/Fbiun3+
 qopFCKypXthmnPOEYeJchxoHNr30qB4Qonm4m+TAeVkMfTMoJoo6mSz7GU0NLMxgnEqc
 ojpA87s2y4NyhXQmTeCfSajvgG7fWGL0BYdbdQJZaJtq6mIH4JxOqDbEtSbHui2REI2g
 Pv5A==
X-Gm-Message-State: ACrzQf15Udtzfggoqm3yqBExnV6Ms33mUn7BaP8opA1fyK7DJUhrIpYb
 0xCrnrJq1AYQ4xzS7PRJlMOO0IQANVbAvzyDrO2LcktKwv5ZxvciybgapfriLbYbQfaw4ziSeQj
 cFtwcxCnRY/pH6xNYalJhWX9/2Q==
X-Received: by 2002:a05:620a:8082:b0:6ee:e7b7:4624 with SMTP id
 ef2-20020a05620a808200b006eee7b74624mr16069322qkb.460.1666386633222; 
 Fri, 21 Oct 2022 14:10:33 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5cAS4MuiNj4r85s90WxIiZrgx5ASWb2AcB8f8f32OzOcG5VKVM1xQaFNvRVmqX8ZUAe5jEvA==
X-Received: by 2002:a05:620a:2625:b0:6ee:97f6:69c2 with SMTP id
 z37-20020a05620a262500b006ee97f669c2mr14642650qko.209.1666386622249; 
 Fri, 21 Oct 2022 14:10:22 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c68:4300::feb? ([2600:4040:5c68:4300::feb])
 by smtp.gmail.com with ESMTPSA id
 k11-20020a05620a414b00b006e99290e83fsm10516951qko.107.2022.10.21.14.10.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 14:10:20 -0700 (PDT)
Message-ID: <51d19bbc22d0438c8e16cc3434950e3dc13f198d.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Fri, 21 Oct 2022 17:10:19 -0400
In-Reply-To: <20221021134941.8b667fd86087be61c22c3593@linux-foundation.org>
References: <20221019122934.866205-1-apopple@nvidia.com>
 <bdaca873243ca55de9b286d732c46729f2d96415.camel@redhat.com>
 <20221021134941.8b667fd86087be61c22c3593@linux-foundation.org>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] [PATCH] nouveau: Fix migrate_to_ram() for faulting
 page
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 linux-mm@kvack.org, Ben Skeggs <bskeggs@redhat.com>,
 nouveau@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, 2022-10-21 at 13:49 -0700, Andrew Morton wrote:
> On Fri, 21 Oct 2022 15:53:19 -0400 Lyude Paul <lyude@redhat.com> wrote:
> 
> > > Hi Andrew/Ben, apologies I must have accidentally dropped this small hunk
> > > when rebasing prior to sending v2 of the original series. Without this
> > > migration from GPU to CPU won't work in Nouveau so hopefully one of you can
> > > take this for v6.1-rcX. Thanks.
> > 
> > Hi!
> > 
> > Reviewed-by: Lyude Paul <lyude@redhat.com>
> > 
> > I will push this to drm-misc-next in just a moment, thanks for the patch!
> 
> Linus merged it but minutes ago.

Agh, sorry about that - I already pushed this over an hour ago

> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

