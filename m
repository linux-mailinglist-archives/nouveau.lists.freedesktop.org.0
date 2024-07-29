Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6933F93EA5E
	for <lists+nouveau@lfdr.de>; Mon, 29 Jul 2024 02:55:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 097D910E0A0;
	Mon, 29 Jul 2024 00:55:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="VgbpKZF4";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF0D310E0A0
 for <nouveau@lists.freedesktop.org>; Mon, 29 Jul 2024 00:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1722214514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8J5V+Uc/ugnqk8cnHuoGWHcvX512xvZRRkqk/OxQX48=;
 b=VgbpKZF4rCOzRxmKsik8v1UfCuVXCcKdvI9FY1R/kOErRDBKZjX0D2E6qMZNiFYnd4asn1
 +RXkqP1iY5yOyWEjdMwrPwr4g608B0oJzs4SD0r08FTpdsSNW3i8euKaL02CHelOZLrAtj
 EdAJRACeh9dPChZSvDccunsjn18GLVg=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-54-P37zCwliOpmFysBgLoDnHQ-1; Sun, 28 Jul 2024 20:55:13 -0400
X-MC-Unique: P37zCwliOpmFysBgLoDnHQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-a7d63fbf4afso72627666b.2
 for <nouveau@lists.freedesktop.org>; Sun, 28 Jul 2024 17:55:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722214512; x=1722819312;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8J5V+Uc/ugnqk8cnHuoGWHcvX512xvZRRkqk/OxQX48=;
 b=FlkqcpuPZ5/T+ZsE9i0rXb86MiQGBgp0+RPEpxRKF1+1qKAZ5hncr83zT/XQ5UgBEd
 Uq/GYXBzfSq/2ZuL50IyY32WBdwtGokkMJjqLCRBbN3iImROpJmzbKPmGp+Q41FwqqzT
 Mqrh1fhV8wK6dFFxoG9+8dDGSOCGkhXdLqJsuWsXbqVMysKPo46iE734v6IK6hdYd1J+
 6IK7yUHo4enF5WCyE8Mk310SwSOlRx+kgBQG1pcurOnne/hWFYVLMKBSoV4hcdKjaFx/
 NUbINoVl5fHAPe01NAqqF2GnkQ5LdclnnB2/ty3MCP1qz9rRLCyKEesueT4M93u50t8a
 UsaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMus4u4xGx230XQ+2wtMYhskIk2KU+gBuLwd6ZZI8T2RJ+Ut2+uUUEZyCBEOglj0QNUlRiY1YvONLD+IKkn1zadwnkgiDOaHnoxHyctw==
X-Gm-Message-State: AOJu0YwVNjtocYfmS1+GbqvpPQlvHYaD1H5aip4YhZ18/LEfzm7MqukD
 nlFYltGOjBzaUFU15DBs1d4LiNeFSClUrRZLVz82Hpw39h7Eb97xVE31OI7nvMFr9R1L8ImFEVn
 k7fCktMHqvgX2XBkwYSu+tLziLTaHpfxroekB/NMwv0LRgeS6lzP8RRKmkXajl1E=
X-Received: by 2002:a17:907:72c1:b0:a7a:8876:4427 with SMTP id
 a640c23a62f3a-a7d40071af4mr412498966b.25.1722214511962; 
 Sun, 28 Jul 2024 17:55:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuaTIU7dTICoyL0eWJhKmA58E+y45g5hmvQj7FBeehllatPsVYsf5wLMY4sEvhxJQxTvJFuA==
X-Received: by 2002:a17:907:72c1:b0:a7a:8876:4427 with SMTP id
 a640c23a62f3a-a7d40071af4mr412498366b.25.1722214511510; 
 Sun, 28 Jul 2024 17:55:11 -0700 (PDT)
Received: from pollux.localdomain ([2a02:810d:4b3f:ee94:1880:4e6c:1065:fb6a])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acad41dd2sm440338266b.107.2024.07.28.17.55.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jul 2024 17:55:11 -0700 (PDT)
Date: Mon, 29 Jul 2024 02:55:09 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Ben Skeggs <bskeggs@nvidia.com>, nouveau@lists.freedesktop.org
Subject: Re: [PATCH v2 02/37] drm/nouveau: handle pci/tegra drm_dev_{alloc,
 register} from common code
Message-ID: <ZqbobYsn9-ag86hJ@pollux.localdomain>
References: <20240704183721.25778-3-bskeggs@nvidia.com>
 <Zo1UP-aapSyf2Rnj@pollux>
 <e67e0c36-5c21-4f37-b489-78ec45298c4e@nvidia.com>
 <ZppJuiWfgfkEKeCH@pollux>
 <9760d7df-dfbf-478e-9b0e-ddc7768b8de1@nvidia.com>
 <ZqPDkZ2t5MjXX4Sx@cassiopeiae>
 <a6b13446-d903-4a94-9afc-ce04b41d5dbf@nvidia.com>
 <20240728181308.GA3043865@nvidia.com>
 <Zqa5VovShzF1lGC2@pollux.localdomain>
 <20240728230452.GZ3371438@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20240728230452.GZ3371438@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

On Sun, Jul 28, 2024 at 08:04:52PM -0300, Jason Gunthorpe wrote:
> On Sun, Jul 28, 2024 at 11:34:14PM +0200, Danilo Krummrich wrote:
> > On Sun, Jul 28, 2024 at 03:13:08PM -0300, Jason Gunthorpe wrote:
> 
> > I think we're on the same page with all that. As clarified in [1], that's not a
> > big concern, I was referring to the changes required to integrate the auxbus
> > stuff.
> 
> Well, I see this thread having the realization that things are not
> setup proeprly to use devres.

We could use it in Nouveau without issue, it starts to become an issue when
moving to the auxbus design because userspace isn't aware. But again, if we
figure out that switching to auxbus is worth it, that is totally fine.

> To be fair devres creates almost as many
> bugs as it solves :\ cleanup.h is possibly a better option for most
> simple things and harder to misuse...

I agree cleanup.h is useful, it has a whole different purpose though.

> 
> > > normal (though most subsystems would call that unregister, not put)
> > 
> > A DRM device is reference counted and can out-live the driver, hence the
> > drm_dev_put() call in .remove(). There is also a special drm_dev_unplug()
> > function, which does not only unregister the DRM device, but also sets a guard
> > to be able prevent HW accesses after the HW is accessible anymore.
> 
> Every subsystem has a refcounted object, struct device is inherently
> refcounted. You call the thing driver calls during .remove()
> 'unregister' because it is special. Once it returns the subsystem has
> to promise no more code is running in driver callbacks and the driver
> is permitted to start destroying anything it might need to use when
> processing any callbacks.

I'm well aware, that is not the case for DRM though. Again, a DRM device can
(and is allowed to) out-live the driver. There can even still be calls into the
driver after it has been unregistered. This is where drm_dev_unplug(),
drm_dev_enter() and drm_dev_exit() [1] are used to guard the places where device
resources, such as MMIO mappings, are accessed.

[1] https://elixir.bootlin.com/linux/v6.10/source/drivers/gpu/drm/drm_drv.c#L436

> 
> This is really tricky and people routinely misunderstand the
> requirements and get this wrong. The consequence is UAF problems in
> obscure cases with unbind races (that few actually care about), but

As for memory safety in this context, DRM has it's own managed memory allocators,
which tie memory allocations to the lifetime of a DRM device. This stuff is
called the DRM managed API [2]. Some structures have to be allocated with, e.g.
drmm_kzalloc(), for this purpose.

[2] https://elixir.bootlin.com/linux/v6.10/source/drivers/gpu/drm/drm_managed.c#L21

> getting it right starts with labeling things properly :)

As for DRM, I think everything is labeled properly.

> 
> We went through this long ago in RDMA because someone actually had a
> usecase of live driver unbind, making that work reliably under a full
> active work load took some thoughtfulness.

And so did DRM. :)

> 
> Jason
> 

