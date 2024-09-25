Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E0A984F75
	for <lists+nouveau@lfdr.de>; Wed, 25 Sep 2024 02:31:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35A2510E03A;
	Wed, 25 Sep 2024 00:31:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Tnyj6Gqq";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BC2710E03A
 for <nouveau@lists.freedesktop.org>; Wed, 25 Sep 2024 00:31:46 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-a8d4093722bso531442266b.0
 for <nouveau@lists.freedesktop.org>; Tue, 24 Sep 2024 17:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727224305; x=1727829105; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=K/9pwGYPPYAs84vniTwGu/e23/s6+5iVY6/PDAAG4us=;
 b=Tnyj6GqqXm/SAlOPxWEXk7OzGebU3mMZMxWA5raNclz47yFI1PRNiFPIGBxypyX6NN
 BQNp2HHGszPu5NCLAQrdFx+4ubOa6CEiBrXRslQVR2pOx7zuCaI7bS9cDdicnp1jUPs7
 22Sj5nm+nBPTVbyFDEXqBM4sD74Va1VXxrmfj30cta098L+DS1TBWNtJVk3c1fP5tnL4
 kD9+u/l5e/uP0FIv6ZjaNcCbXX5U0saw2mvMnk6ctUvHIV7rod71b79vN/voIsVcdhe0
 3OwCj+5xZksZAu8zYcPLgq1ZA4AyhdV9ErJDJ1D5Xi1Ey+mgpWxrixW9SpvYpM+JXa/2
 l7uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727224305; x=1727829105;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K/9pwGYPPYAs84vniTwGu/e23/s6+5iVY6/PDAAG4us=;
 b=awfPTJxHKr/lz6gdP1oarT8lw8yKWQlMkY4W90JNXwPZO+P6Ruu5t4WUIH7AM2qZhT
 fFNgsguwtznIxR23qS4zCW/1jH/q4gVp/vISvHSI1n2l4JWh0hfGdScbUtHMreyh7oRR
 sE8VT/qVv6gkawvs6X0u/6hXdlCVIB8Ud+8FB19XvOX9l0WovKxPFCgbsZ2RGBiCzaWl
 ghhNMwOJusOQg2YZPUibZ1pONVQofbRbTKu6d02XbVwMbvw5z4UkpmzDrgjFcJ3fNbNu
 TLBX/pKHzMnG68XeFhuoWmixig/JaI1HcYrtqEb7ocMP8YeRCshCGWyYNXLRNE9wO2A7
 +jNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/9yod8qfowS0M1GsJ0aj8g1cAuC1NIUonKluqP8v1bZ0TqlV1dE+VbF4smnzXYWvAdDwMmT5k@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyVw9cpvQx1hn5UpjMgWdr32zCJ/Eh9X5eShT8msO2ux1smLH5B
 3KJ8P7MhwM3lvYLO/R7RUA5xz6PLyciaiq6NbDMTQ26tkgB/WfvxcU1hF76EhwzgNPVVST1HSLv
 UlVsei6jv0vNi62k0ivCoJYrmaEA=
X-Google-Smtp-Source: AGHT+IES8mbAOSEQK03hCpA8I4gleTbb1OGNxfdrnBI54A5Kyh/dhdPilb6p2UktQA62b9ecz3ULt1rUmU4VtsfaVYQ=
X-Received: by 2002:a17:907:944e:b0:a86:96f5:fa81 with SMTP id
 a640c23a62f3a-a93a03e32c5mr81294266b.32.1727224304377; Tue, 24 Sep 2024
 17:31:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240922124951.1946072-1-zhiw@nvidia.com>
 <20240922124951.1946072-28-zhiw@nvidia.com>
In-Reply-To: <20240922124951.1946072-28-zhiw@nvidia.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 25 Sep 2024 10:31:33 +1000
Message-ID: <CAPM=9tz34jg8nD703b+iAzWQejjKKfKJgULt+sHAp_N2AYzZMw@mail.gmail.com>
Subject: Re: [RFC 27/29] vfio/vgpu_mgr: bootload the new vGPU
To: Zhi Wang <zhiw@nvidia.com>
Cc: kvm@vger.kernel.org, nouveau@lists.freedesktop.org, 
 alex.williamson@redhat.com, kevin.tian@intel.com, jgg@nvidia.com, 
 daniel@ffwll.ch, acurrid@nvidia.com, cjia@nvidia.com, smitra@nvidia.com, 
 ankita@nvidia.com, aniketa@nvidia.com, kwankhede@nvidia.com, 
 targupta@nvidia.com, zhiwang@kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Sun, 22 Sept 2024 at 22:51, Zhi Wang <zhiw@nvidia.com> wrote:
>
> All the resources that required by a new vGPU has been set up. It is time
> to activate it.
>
> Send the NV2080_CTRL_CMD_VGPU_MGR_INTERNAL_BOOTLOAD_GSP_VGPU_PLUGIN_TASK
> GSP RPC to activate the new vGPU.

This patch is probably the best example of how this can't work.

The GSP firmware interfaces are not guaranteed stable. Exposing these
interfaces outside the nvkm core is unacceptable, as otherwise we
would have to adapt the whole kernel depending on the loaded firmware.

You cannot use any nvidia sdk headers, these all have to be abstracted
behind things that have no bearing on the API.

If a new NVIDIA driver release was to add a parameter inside
NV2080_CTRL_VGPU_MGR_INTERNAL_BOOTLOAD_GSP_VGPU_PLUGIN_TASK_PARAMS how
would you handle it?

Outside of the other discussion, this is the fundamental problem with
working on the GSP firmware. We cannot trust that any API exposed
won't change, and NVIDIA aren't in a position to guarantee it.

Dave.
