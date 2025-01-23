Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F23DA1A1B8
	for <lists+nouveau@lfdr.de>; Thu, 23 Jan 2025 11:20:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 892C310E278;
	Thu, 23 Jan 2025 10:20:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="gNcxPTu6";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 249AB10E278
 for <nouveau@lists.freedesktop.org>; Thu, 23 Jan 2025 10:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737627644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
 bh=n+wGia14dGwN29vdBo/9/2hxcBsxLnFs0mwPA3w7k88=;
 b=gNcxPTu6NMuIhHNGl97/iqnzPl2EqaAojZsfTnuMjUbtholnG244NQ3A1lEk69/wTeT7RS
 CSf0faf8YlImm9GnYSEFdRNCtCBd2fRAmMYfM+meOSLA+C0j7FI3zh8wz+dLiqj3vdWI+S
 NDd2GR+HDtdBa7yywkG6BV5LEyEMJp0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-103-yD7ma4iEMI6BNe-eRKw_0A-1; Thu, 23 Jan 2025 05:20:42 -0500
X-MC-Unique: yD7ma4iEMI6BNe-eRKw_0A-1
X-Mimecast-MFC-AGG-ID: yD7ma4iEMI6BNe-eRKw_0A
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4361d4e8359so5392145e9.3
 for <nouveau@lists.freedesktop.org>; Thu, 23 Jan 2025 02:20:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737627641; x=1738232441;
 h=content-transfer-encoding:subject:to:organization:autocrypt:cc
 :content-language:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=n+wGia14dGwN29vdBo/9/2hxcBsxLnFs0mwPA3w7k88=;
 b=Qy71skxOvEtEf/LGv66Z2Pk//TIuju3/sVKbXYrh7cQUsR79ELCyJQXUgWn/3f+s1t
 zOxY2rNL6cxacbWKPjgcuAVIijZ5fKP/5vJlIEo2byGVMB9OFjRo73oOLqig9DrT4Wo7
 UI1yaUv1kZAX1eDQnaSjI/uXH3Sngi+PlEnsrh2VaL3qvqSIJaxdK4cDLJOYo9eqz3bj
 bEAOtI5H0Y7LB7TFqG5Vb4VWNo9QQvYCC+Z73z6u5THNBBSNGvawAdNYJzCmhfeUFl8n
 s65wt7k+/GjufnVec/Gx4I2B5mZlwkoWOELMh/Y0ard683WMjcoav5Ouiw57GysZj2tA
 bljg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpujqHLiyfQ3oBy7TqR5xImnvD7zBVODJ1ETYq5TbBqbOoyy6UPYMogy0M8FqC/9AgaKkxDG6t@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwBXgpN/9HG06zJBkU2JssJ8p4siTYAP+Z0M6zxliN59BQETjma
 CHzCBRwjOv3d+FFpUyFOSo8FhlfLm2m8SooVTUQkVnANKA50mr2G3q4Pp8c7iWWbUyuJdZT+8Aj
 7E+AzzAcXg3NReBzz2zrk1a2FSNTpCx+4GUEpqzuD4Hx0VGhce5O8cnRi5bgiFII=
X-Gm-Gg: ASbGncsK3cawI3+TIwDBsCCSYufhmcWI3YAxVcW3aFTamzgXLgXGYgOaNWfNbe53QUQ
 KiZWsKXeDCGrzAKMXKmD9xlcK+JxbB2Y+poMRk6cSvO/4b9dVwOti1TfBW5EuwAWP+owEyvr46c
 nluTzK19O7tgMWd9iAWRGGZaxM4ngY6ASUSN7sBotSeHkCx0DJInv6yEHa67JH7MmwvP1j74aWQ
 7ApP1lMXeR9AVcZe0TcJanXjzkQW1vOAYFKb9JXHFx1yVj8/oOHOsm1MPEsyDj5kDIgdGwkImSh
 1/AKdsOu+0pd2U3A40r8DXOmWIaT75dCBfbMqq3ibW5qn9pTCPElFPwIjH9+Qk8S+7CM/9cnoiN
 ExaJblTyD7Ynxw2J0zcqwCA==
X-Received: by 2002:a05:600c:4743:b0:434:ff25:199f with SMTP id
 5b1f17b1804b1-438914309a8mr187505485e9.26.1737627641549; 
 Thu, 23 Jan 2025 02:20:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGK5UH+INgn+5/Di/pesvq9JHyNkB/a1MNPTzn1K8rJZwYB4w9bxe2GWdXEeN+ysaBUTXCdpw==
X-Received: by 2002:a05:600c:4743:b0:434:ff25:199f with SMTP id
 5b1f17b1804b1-438914309a8mr187505185e9.26.1737627641130; 
 Thu, 23 Jan 2025 02:20:41 -0800 (PST)
Received: from ?IPV6:2003:cb:c70b:b400:e20a:6d03:7ac8:f97d?
 (p200300cbc70bb400e20a6d037ac8f97d.dip0.t-ipconnect.de.
 [2003:cb:c70b:b400:e20a:6d03:7ac8:f97d])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438b31b1618sm58827435e9.24.2025.01.23.02.20.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jan 2025 02:20:39 -0800 (PST)
Message-ID: <346518a4-a090-4eaa-bc04-634388fd4ca3@redhat.com>
Date: Thu, 23 Jan 2025 11:20:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: David Hildenbrand <david@redhat.com>
Cc: John Hubbard <jhubbard@nvidia.com>, nouveau@lists.freedesktop.org,
 Jason Gunthorpe <jgg@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
To: "linux-mm@kvack.org" <linux-mm@kvack.org>
Subject: [Question] Are "device exclusive non-swap entries" / "SVM atomics in
 Nouveau" still getting used in practice?
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pJldby_LEx-HKLFV8ycOsMxG04WMP8L4ZtvQkz7e4Vc_1737627641
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi,

I keep finding issues in our implementation of "device exclusive 
non-swap entries", and the way it messes with mapcounts is disgusting.

As a reminder, what we do here is to replace a PTE pointing to an 
anonymous page by a "device exclusive non-swap entry".

As long as the original PTE is in place, the only CPU can access it, as 
soon as the "device exclusive non-swap entry" is in place, only the 
device can access it. Conversion back and forth is triggered by CPU / 
device faults.

I have fixes/reworks/simplifications for most things, but as there is 
only a "real" single user in-tree of make_device_exclusive():

	drivers/gpu/drm/nouveau/nouveau_svm.c

to "support SVM atomics in Nouveau [1]"

naturally I am wondering: is this still a thing on actual hardware, or 
is it already stale on recent hardware and not really required anymore?


[1] https://lore.kernel.org/linux-kernel//6621654.gmDyfcmpjF@nvdebian/T/

-- 
Cheers,

David / dhildenb

