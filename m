Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F27D6D25CC8
	for <lists+nouveau@lfdr.de>; Thu, 15 Jan 2026 17:40:08 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6E63C10E7AF;
	Thu, 15 Jan 2026 16:40:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ajgs/5uV";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id CC58144CB3;
	Thu, 15 Jan 2026 16:31:31 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768494691;
 b=KHltSl+U2ozYqLezLvNhN3qvTbu4XECDkOwFw7LH0u9ueF5FlIEGlngxgINkFMPzrGkWQ
 2S1wdPpwGUw3FNaksnAwwst+ddw3xLBegdHaEUbT9hx0qM4ftm44vW81vIhGHReBL0Y/msf
 C7u+Z3QsHBNOIAAE3EW+qMy7pXBpZK7O434IK3OaqCF4Vi75o/1UpkdKNa2J8u5PAzpRfZ3
 Tx2Zjm4+gwe8me0HTjz0ZtqRVBhO43d8N8AGXysypLGTfFLzNHDzL6wgPW1HWAU9fWXQ7fQ
 5aV2zFeqwR3zl3mZRa1juGLBkAvQIAfgKqdUc4pcwOAR0bzKF4/MCIwn1bDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768494691; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Gw9UCSQ3Yq54mN6+1Sm2OXnKOniSzh3Es+iNRsKb/00=;
 b=Na+VYJ10RZyfITwGT9Ne2pwbPWN1UL0nf5AJLEVHoPk+Wu6M4yvh6/VA4ZEAU+72BAtDR
 KUwtXk51kcs573udrJgsP85gt88SQ1k1TWcOswKKy/YrbafBL8xL9blSHQZYT80Pxakls/4
 jHGjgDT35YiJSBLXcO2at8QuO36sbiY1cpa5wiEpotZKKzh72TmciMZWvUJodOCrscVqhXp
 BJW9pSeGtf2qZX9bA8zRNdHG3Hdq7fN9V19IkkSvnyw2sMnuBvziZdcB+vkFeGINeXtLE1B
 cXI+DTZjh/56DRvsqIr1e3llXI6zo7gNn69tJ3D012gAYMMwzwbX4QkuaT+Q==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=kernel.org;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=kernel.org;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 0E4B844C9F
	for <nouveau@lists.freedesktop.org>; Thu, 15 Jan 2026 16:31:29 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 452F210E7A0;
	Thu, 15 Jan 2026 16:40:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 425D460128;
	Thu, 15 Jan 2026 16:40:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE65FC116D0;
	Thu, 15 Jan 2026 16:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768495201;
	bh=m/Qx1m1mblaNipkWax3IZgERtuZ8Zkg6ma1HJe/Md/E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ajgs/5uVyXu7H8VC4ngrms4uARgCVFYOon/i7wj+tn1w72j7H9T4CM/BxlZwd5lfS
	 ArM+/+rYU3rKnLV6+pVVvz2xEyrpoFlBKWFw0boo3efTETsCmzQu/ZE0OeVtl0dB+f
	 OsIA6BVINFZuD/IWhl5QhJw7xQ/V3+KuhWleDmm2Uu0LE4mBpC5uY2z5TWKQR60521
	 okmZ3GiKI4O0OQKRcKN8BhBRretfYIV+o+nSHwdJyyofS2pOTXfPpeZVnq7A8/4fqQ
	 5muGt/pK+Fzt9ilSvbB4X7VBJVKErM24M547oE1T0H0ecZk5Yym+Nzm5jURgtti7jE
	 zgal0OGtjOvSg==
Message-ID: <c78e9794-e63f-47f9-a4cb-e3b5625ab828@kernel.org>
Date: Thu, 15 Jan 2026 10:39:56 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/12] Recover sysfb after DRM probe failure
To: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20251229215906.3688205-1-zack.rusin@broadcom.com>
 <c816f7ed-66e0-4773-b3d1-4769234bd30b@suse.de>
 <CABQX2QNQU4XZ1rJFqnJeMkz8WP=t9atj0BqXHbDQab7ZnAyJxg@mail.gmail.com>
 <97993761-5884-4ada-b345-9fb64819e02a@suse.de>
 <9058636d-cc18-4c8f-92cf-782fd8f771af@amd.com> <aWkDYO1o9T1BhvXj@intel.com>
 <aWkWSnJ7Xn6ukW-b@sirius.home.kraxel.org>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <aWkWSnJ7Xn6ukW-b@sirius.home.kraxel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: J2GYUBAFS5MSQ3ESOLYBIOAHGHL24A5N
X-Message-ID-Hash: J2GYUBAFS5MSQ3ESOLYBIOAHGHL24A5N
X-MailFrom: superm1@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
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
 Mario Limonciello <mario.limonciello@amd.com>,
 Maxime Ripard <mripard@kernel.org>, nouveau@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 spice-devel@lists.freedesktop.org,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, virtualization@lists.linux.dev,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/J2GYUBAFS5MSQ3ESOLYBIOAHGHL24A5N/>
Archived-At: 
 <https://lore.freedesktop.org/c78e9794-e63f-47f9-a4cb-e3b5625ab828@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 1/15/26 10:36 AM, Gerd Hoffmann wrote:
>    Hi,
> 
>>> At least for AMD GPUs remove_conflicting_devices() really early is
>>> necessary because otherwise some operations just result in a
>>> spontaneous system reboot.	
> 
>> It's similar for Intel. For us VGA emulation won't be used for EFI
>> boot, but we still can't have the previous driver poking around in
>> memory while the real driver is initializing. The entire memory layout
>> may get completely shuffled so there's no telling where such memory
>> accesses would land.
> 
> Can you do stuff like checking which firmware is needed and whenever
> that can be loaded from the filesystem before calling
> remove_conflicting_devices() ?
> 

That's something that I did in amdgpu a few years back.

I pushed the identification and ability to load firmware into early init 
stages.  It means that if you have a brand new GPU and run a modern 
kernel with an older linux-firmware snapshot amdgpu will fail probe and 
your framebuffer from EFI keeps working.
