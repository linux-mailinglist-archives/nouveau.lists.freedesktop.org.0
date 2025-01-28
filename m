Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14400A20B3A
	for <lists+nouveau@lfdr.de>; Tue, 28 Jan 2025 14:20:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8538810E63A;
	Tue, 28 Jan 2025 13:20:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="jHRYBivV";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7E5210E1B4
 for <nouveau@lists.freedesktop.org>; Tue, 28 Jan 2025 13:20:36 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id
 af79cd13be357-7b6ef047e9bso534808685a.1
 for <nouveau@lists.freedesktop.org>; Tue, 28 Jan 2025 05:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1738070435; x=1738675235; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=GOWXoYYRnWMsoeKK+VVuf/lMuv2V7GO+mfTTLFXfUSE=;
 b=jHRYBivVVkVDTe5D5aEc6CMgyOWp5Dnqomjl0jpUdtlsNZPWj9AsycMm3NKNDMVDL6
 ceAeDkv121kbek5mAlNZTfZ5uv5qKhfp0Ays7C+ZDJ9A2tNcmG71xAOCFGdL9Pmexz77
 rwVkSVhvIn1UJ5nJm1c8nmLpYyfLA0wTHVOGAvTKcouvERbH1pIZGo8onHF4Qe7TyRAf
 i5YAxNiAbF6ZOioNFSs7oZ5nSZMZLii6Hzbjj+TS8GUVnrvi5A7qrzfxpOFHYGbU5+sY
 kjjqDf511UIVp/71Sxg+KunyAYVnk8JoQb1JM3GdChhW5edBpfK8pQEkEBj2jZbnCbiA
 NWLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738070435; x=1738675235;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GOWXoYYRnWMsoeKK+VVuf/lMuv2V7GO+mfTTLFXfUSE=;
 b=AAAbuQ6nnkpGsjXjwhzWttO5zkNdts6DUmDf9t8JJs22PE7iXncNOCAGZ2YvdFAk47
 HNg6w39Vu6WYLtvu7Ktp/G7papS/eHX7q8s4LLnb6CVQsDx1druLBtPSr/QE9tWrqBDi
 bQRRAGbhpD0tF8h4jxrw54EMS8BSa3+IeonB+4rPXJQ/52dyfPEI47M5FLOqKJqLSLOl
 GgD8evo/0Vy96ERUASzQTG15Eb5uoG7EylPLLUhNn5ofiX4ckVaCDMTqAGN2u0ov003d
 +ylxFFscv7AHlVmoB8YicZV7If9VM+6ns6+Fsah9RarMeYcUaYB2wLIAI77MCGPvZZUD
 nqDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXN8r9v36/xOlKTzB57eNjQakbSCkBjkdwxLTUf5zcYp9x8sNfTWaF73N0WYhpyRcZFG7VjmcrR@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyRowLXTF9tZ53BFjcZ05vBDzxjO1rlQEhzH6I9SIeBatJ+yobj
 HM1c2OI5Pp0rHSFuZMSdI2ASQxEb5ffPYC7GcN3aEZuzNqgdl09Bt9Qw9/bhWwo=
X-Gm-Gg: ASbGnctyzS2rF6lzombTmvCyObFxgParCR5OfyNFPjONbPcsHkuSLp53+D7hfQNXzmG
 bgpc3nmlo1P2+v90zo4rJD17o2VWNln+k+lkGqev6Jtnjb13nDBZ+JPkOInGA6yQj/fGDCLTByu
 96OqEpqyKd6AbeySpcmguhB/I0Lz+uRNqqo4TvIliIdQpOqhIKRqY1QlQAmwkDMEYm0+lxVLDvX
 pqEYv3teECGjMnx3fOAOatAloPcXYA0t4FTTXdKGiXCqcPEWSpFF7oEJo7jDNAMFmHM5tfaNvRs
 FIDt3SnKaVkl4DJnTIML41mNpen+JdAAQMg+RlYTe278CzP3hcw3zKKLPH16cbhatXGCA077oIw
 =
X-Google-Smtp-Source: AGHT+IFfqsRD0FOVkdIg887UXRm977J4ky26yoqHXaGeXqELEj2EneWq+CuXUYKkdzvufPHaZSVAIg==
X-Received: by 2002:a05:620a:3910:b0:7b7:142d:53a8 with SMTP id
 af79cd13be357-7bff3fb4946mr402618885a.19.1738070435489; 
 Tue, 28 Jan 2025 05:20:35 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.128.5]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7be9aeedc68sm512887085a.74.2025.01.28.05.20.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2025 05:20:34 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1tclW6-00000007TbE-14aw;
 Tue, 28 Jan 2025 09:20:34 -0400
Date: Tue, 28 Jan 2025 09:20:34 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Yonatan Maman <ymaman@nvidia.com>, kherbst@redhat.com, lyude@redhat.com,
 dakr@redhat.com, airlied@gmail.com, simona@ffwll.ch,
 leon@kernel.org, jglisse@redhat.com, akpm@linux-foundation.org,
 GalShalom@nvidia.com, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-mm@kvack.org, linux-tegra@vger.kernel.org
Subject: Re: [RFC 1/5] mm/hmm: HMM API to enable P2P DMA for device private
 pages
Message-ID: <20250128132034.GA1524382@ziepe.ca>
References: <20241201103659.420677-1-ymaman@nvidia.com>
 <20241201103659.420677-2-ymaman@nvidia.com>
 <7282ac68c47886caa2bc2a2813d41a04adf938e1.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7282ac68c47886caa2bc2a2813d41a04adf938e1.camel@linux.intel.com>
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

On Tue, Jan 28, 2025 at 09:51:52AM +0100, Thomas Hellström wrote:

> How would the pgmap device know whether P2P is actually possible
> without knowing the client device, (like calling pci_p2pdma_distance)
> and also if looking into access control, whether it is allowed?

The DMA API will do this, this happens after this patch is put on top
of Leon's DMA API patches. The mapping operation will fail and it will
likely be fatal to whatever is going on.
 
get_dma_pfn_for_device() returns a new PFN, but that is not a DMA
mapped address, it is just a PFN that has another struct page under
it.

There is an implicit assumption here that P2P will work and we don't
need a 3rd case to handle non-working P2P..

> but leaves any dma- mapping or pfn mangling to be done after the
> call to hmm_range_fault(), since hmm_range_fault() really only needs
> to know whether it has to migrate to system or not.

See above, this is already the case..

> One benefit of using this alternative
> approach is that struct hmm_range can be subclassed by the caller and
> for example cache device pairs for which p2p is allowed.

If you want to directly address P2P non-uniformity I'd rather do it
directly in the core code than using a per-driver callback. Every
driver needs exactly the same logic for such a case.

Jason
