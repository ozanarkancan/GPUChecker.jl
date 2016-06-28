module GPUChecker

# package code goes here
function gpu_usages()
	rawtext = readall(pipeline(`nvidia-smi`, `grep |`, `grep N/A`))
	str_usages = split(rawtext, '\n')
	usages = []
	for usg in str_usages
		if usg != ""
			usage, capacity = map(x->parse(Int, match(r"(\d+)", x).captures[1]),split(strip(split(usg, '|')[3]), '/'))
			push!(usages, (usage, capacity))
		end
	end
	return usages
end

function first_min_used_gpu()
	usages = gpu_usages()
	return indmin(usages) - 1
end

export gpu_usages
export first_min_used_gpu

end # module
