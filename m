Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5688D25C74
	for <lists+nouveau@lfdr.de>; Thu, 15 Jan 2026 17:37:03 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0B0A310E7AF;
	Thu, 15 Jan 2026 16:37:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="MxfoS/i2";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7079444CB3;
	Thu, 15 Jan 2026 16:28:28 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768494508;
 b=vC2KZGksf1WYwETJfnXQ3HnvQT5xm/MJNbsupTtiTx5BmvuOnyP8dtnPSsGwEknuBexTX
 v84hFWDgU565L6l0hPts4gcEpGITmiPLdAYE/JS4xE9F2wbPTT9yTLox13vB2zMVR+Fyt9j
 X0LtS8nyu/XOuJptOtpI1fupMFx1SGBee6nvTsQn6/7+nlNlFbe7ZPo3UmpHsDvOLHpYY9/
 lrZ4bzPhziNTCg2/qpezhy6KSeFWdk1+BxXdQAaZlEH7CMzFnX+8jV4Z9Ta3s2EKfxoBcUr
 VBp9cv9Ui4T2LYqmGNe27fCl2n/eaFRos9PWExTVujZ/FnYRIx/rzjJSnXNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768494508; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=YapI6yvvFKBlNsIuFY3dURmJ8ly4nR9lByNbPeI57Wk=;
 b=OJb355InEBr5EWOc+qSbz/NOjWpTGvh5WWDDsPZGWgGTVlD43p18XL7NULxKAIguSgR4u
 JI97vfZ65dJdiHJ0yy9LPvYtibbGcutOhPOOQK8LaH5WmbH2P1qwsLofVZB50QYRBWYiY4E
 CKK3SWjCMu9ObDysbpDHXF6nmoA6n93niDz681QOwo2/yl3SNv8Onu4fNMm6g+u0+FOPVDw
 ftxbmmSjsIdjZTboaI6aih4lvZOZuUm7uDyvYaG1CCSKon3NFr8a7kG3AS0hUMdrasgznWd
 uITIJZOY8hxAnxxzViiWhJvxnZ04xdzdCcW4yjTwbfIjqWiDa7zYUvNXj/FQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=redhat.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=redhat.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=redhat.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=redhat.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 38C4F44CA1
	for <nouveau@lists.freedesktop.org>; Thu, 15 Jan 2026 16:28:25 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 724AA10E7AB
	for <nouveau@lists.freedesktop.org>; Thu, 15 Jan 2026 16:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768495017;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YapI6yvvFKBlNsIuFY3dURmJ8ly4nR9lByNbPeI57Wk=;
	b=MxfoS/i23ysdN77ZkRTqUDc5bBu8xkZqB/hxXEQYxDIOy+y5n/+poY83/H/lpzycSkerLT
	RFAMTI9ttsOt+uulnsSIRdHi9sP4LgG9VFfRUVftKx8uIZqUvqyIgDP8TyiKJ7PW2NS+Kj
	giS07GmXUzMXdKep3vkp3vW2pUBulwE=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-121-EF4CM8dfMF-Md1jPR3oF-A-1; Thu,
 15 Jan 2026 11:36:53 -0500
X-MC-Unique: EF4CM8dfMF-Md1jPR3oF-A-1
X-Mimecast-MFC-AGG-ID: EF4CM8dfMF-Md1jPR3oF-A_1768495009
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id DD6D7180035D;
	Thu, 15 Jan 2026 16:36:47 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.45.224.56])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with
 ESMTPS id CFC961955F22;
	Thu, 15 Jan 2026 16:36:45 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 9866C18483A0; Thu, 15 Jan 2026 17:36:43 +0100 (CET)
Date: Thu, 15 Jan 2026 17:36:43 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 00/12] Recover sysfb after DRM probe failure
Message-ID: <aWkWSnJ7Xn6ukW-b@sirius.home.kraxel.org>
References: <20251229215906.3688205-1-zack.rusin@broadcom.com>
 <c816f7ed-66e0-4773-b3d1-4769234bd30b@suse.de>
 <CABQX2QNQU4XZ1rJFqnJeMkz8WP=t9atj0BqXHbDQab7ZnAyJxg@mail.gmail.com>
 <97993761-5884-4ada-b345-9fb64819e02a@suse.de>
 <9058636d-cc18-4c8f-92cf-782fd8f771af@amd.com>
 <aWkDYO1o9T1BhvXj@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWkDYO1o9T1BhvXj@intel.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-ID-Hash: IJ4BTLJ4XUHUH64OGPSM6DMZDUKUDZLW
X-Message-ID-Hash: IJ4BTLJ4XUHUH64OGPSM6DMZDUKUDZLW
X-MailFrom: kraxel@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Zack Rusin <zack.rusin@broadcom.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 Ard Biesheuvel <ardb@kernel.org>, Ce Sun <cesun102@amd.com>,
 Chia-I Wu <olvaffe@gmail.com>, Danilo Krummrich <dakr@kernel.org>,
 Dave Airlie <airlied@redhat.com>, Deepak Rawat <drawat.floss@gmail.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Hans de Goede <hansg@kernel.org>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Helge Deller <deller@gmx.de>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jocelyn Falempe <jfalempe@redhat.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lijo Lazar <lijo.lazar@amd.com>, linux-efi@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 "Mario Limonciello (AMD)" <superm1@kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Maxime Ripard <mripard@kernel.org>, nouveau@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 spice-devel@lists.freedesktop.org,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Timur =?utf-8?Q?Krist=C3=B3f?= <timur.kristof@gmail.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, virtualization@lists.linux.dev,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/IJ4BTLJ4XUHUH64OGPSM6DMZDUKUDZLW/>
Archived-At: 
 <https://lore.freedesktop.org/aWkWSnJ7Xn6ukW-b@sirius.home.kraxel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

  Hi,

> > At least for AMD GPUs remove_conflicting_devices() really early is
> > necessary because otherwise some operations just result in a
> > spontaneous system reboot.	

> It's similar for Intel. For us VGA emulation won't be used for EFI
> boot, but we still can't have the previous driver poking around in
> memory while the real driver is initializing. The entire memory layout
> may get completely shuffled so there's no telling where such memory
> accesses would land.

Can you do stuff like checking which firmware is needed and whenever
that can be loaded from the filesystem before calling
remove_conflicting_devices() ?

take care,
  Gerd

